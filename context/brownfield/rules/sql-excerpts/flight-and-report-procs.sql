-- Excerpt of live stored procedures from database/FLT_Schema.sql (called from code, with branching logic).
-- Each line is prefixed with its ORIGINAL line number in database/FLT_Schema.sql.
-- Cite rules as database/FLT_Schema.sql:<that number>, never this excerpt file.

-- ===== addFlight (database/FLT_Schema.sql:3799-3983) =====
/*3799*/ CREATE PROCEDURE [dbo].[addFlight]
/*3800*/ 	@AircraftId Int,
/*3801*/ 	@LocationId Int,
/*3802*/ 	@SchedRouteId Int,
/*3803*/ 	@FlownRouteId INT,
/*3804*/ 	@FlightDate varchar(10),
/*3805*/ 	@FlightDateSort VARCHAR(10),
/*3806*/ 	@WorkShiftIndicatorId Int,
/*3807*/ 	@AirframeWeightId INT = 0,
/*3808*/ 	@Cargo1WeightId INT = 0,
/*3809*/ 	@Cargo2WeightId INT = 0,
/*3810*/ 	@BallastWeightId INT = 0,
/*3811*/ 	@PilotId INT,
/*3812*/ 	@PreFlightFtiOK smallint = 0,
/*3813*/ 	@PreFlightTelemetryOK smallint = 0,
/*3814*/ 	@PreFlightTelemetryCheckComplete smallint = 0,
/*3815*/ 	@OilLevelIndicatorStart smallint = 0,
/*3816*/ 	@HydraulicLevelIndicatorStart smallint = 0,
/*3817*/ 	@UsedMeterOffset DECIMAL(9,1) = 0,
/*3818*/ 	@MeterUnitId INT,
/*3819*/ 	@DepartureTime varchar(8),
/*3820*/ 	@DepartureDateTime_Local DATETIME,
/*3821*/ 	@DepartureDateTime_UTC DATETIME,
/*3822*/ 	@AircraftEngineHoursCurrent DECIMAL(11,1) = 0,
/*3823*/ 	@EngineHoursStart DECIMAL(7,1) = 0,
/*3824*/ 	@HobbsStart DECIMAL(9,1),
/*3825*/ 	@AirframeHoursStart DECIMAL(9,1),
/*3826*/ 	@ReturnTime varchar(8),
/*3827*/ 	@ReturnDateTime_Local DATETIME,
/*3828*/ 	@ReturnDateTime_UTC DATETIME,
/*3829*/ 	@HobbsEnd DECIMAL(9,1),
/*3830*/ 	@AirframeHoursEnd DECIMAL(9,1),
/*3831*/ 	@EngineHoursEnd DECIMAL(7,1) = 0,
/*3832*/ 	@PostFlightFtiOK smallint = 0,
/*3833*/ 	@PostFlightTelemetryCheckComplete smallint = 0,
/*3834*/ 	@NacelleCheckBuildUp smallint = 0,
/*3835*/ 	@NacelleCheckDiscoloration smallint = 0,
/*3836*/ 	@IsApproved BIT = 0,
/*3837*/ 	@ApprovedBy NVARCHAR(20) = '',
/*3838*/ 	@UtcDateApproved DATETIME,
/*3839*/ 	@StampUserName nvarchar(20), 
/*3840*/ 	@FlightId INT OUTPUT, 
/*3841*/ 	@NewUTCDate datetime OUTPUT,
/*3842*/ 	@NewConcurrencyId bigint OUTPUT
/*3843*/ AS
/*3844*/ BEGIN
/*3845*/ 	SET NOCOUNT ON
/*3846*/ 
/*3847*/ 	IF (SELECT COUNT(*) FROM Flight 
/*3848*/ 		WHERE AircraftId = @AircraftId 
/*3849*/ 		AND LocationId = @LocationId 
/*3850*/ 		AND FlightDateSort = @FlightDateSort 
/*3851*/ 		AND WorkShiftIndicatorId = @WorkShiftIndicatorId
/*3852*/ 		AND IsDeleted = 0) <> 0 
/*3853*/ 	BEGIN
/*3854*/ 		RAISERROR('Duplicate Flight Entry',16,1)
/*3855*/ 	END
/*3856*/ 
/*3857*/ 	INSERT INTO [dbo].[Flight] (
/*3858*/ 		AircraftId,
/*3859*/ 		LocationId,
/*3860*/ 		SchedRouteId,
/*3861*/ 		FlownRouteId,
/*3862*/ 		FlightDate,
/*3863*/ 		FlightDateSort,
/*3864*/ 		WorkShiftIndicatorId,
/*3865*/ 		AirframeWeightId,
/*3866*/ 		Cargo1WeightId,
/*3867*/ 		Cargo2WeightId,
/*3868*/ 		BallastWeightId,
/*3869*/ 		PilotId,
/*3870*/ 		PreFlightFtiOK,
/*3871*/ 		PreFlightTelemetryOK,
/*3872*/ 		PreFlightTelemetryCheckComplete,
/*3873*/ 		OilLevelIndicatorStart,
/*3874*/ 		HydraulicLevelIndicatorStart,
/*3875*/ 		UsedMeterOffset,
/*3876*/ 		MeterUnitId,
/*3877*/ 		DepartureTime,
/*3878*/ 		DepartureDateTime_Local,
/*3879*/ 		DepartureDateTime_UTC,
/*3880*/ 		AircraftEngineHoursCurrent,
/*3881*/ 		EngineHoursStart,
/*3882*/ 		HobbsStart,
/*3883*/ 		AirframeHoursStart,
/*3884*/ 		ReturnTime,
/*3885*/ 		ReturnDateTime_Local,
/*3886*/ 		ReturnDateTime_UTC,
/*3887*/ 		HobbsEnd,
/*3888*/ 		AirframeHoursEnd,
/*3889*/ 		EngineHoursEnd,
/*3890*/ 		PostFlightFtiOK,
/*3891*/ 		PostFlightTelemetryCheckComplete,
/*3892*/ 		NacelleCheckBuildup,
/*3893*/ 		NacelleCheckDiscoloration,
/*3894*/ 		IsApproved,
/*3895*/ 		ApprovedBy,
/*3896*/ 		UTCDateApproved,
/*3897*/ 		FlightGuid,
/*3898*/ 		IsActive,
/*3899*/ 		UTCDateCreated,
/*3900*/ 		UTCDateModified,
/*3901*/ 		StampUserName 
/*3902*/ 
/*3903*/ 		)
/*3904*/ 	VALUES (
/*3905*/ 		@AircraftId,
/*3906*/ 		@LocationId,
/*3907*/ 		@SchedRouteId,
/*3908*/ 		@FlownRouteId,
/*3909*/ 		@FlightDate,
/*3910*/ 		@FlightDateSort,
/*3911*/ 		@WorkShiftIndicatorId,
/*3912*/ 		@AirframeWeightId,
/*3913*/ 		@Cargo1WeightId,
/*3914*/ 		@Cargo2WeightId,
/*3915*/ 		@BallastWeightId,
/*3916*/ 		@PilotId,
/*3917*/ 		@PreFlightFtiOK,
/*3918*/ 		@PreFlightTelemetryOK,
/*3919*/ 		@PreFlightTelemetryCheckComplete,
/*3920*/ 		@OilLevelIndicatorStart,
/*3921*/ 		@HydraulicLevelIndicatorStart,
/*3922*/ 		@UsedMeterOffset,
/*3923*/ 		@MeterUnitId,
/*3924*/ 		@DepartureTime,
/*3925*/ 		@DepartureDateTime_Local,
/*3926*/ 		@DepartureDateTime_UTC,
/*3927*/ 		@AircraftEngineHoursCurrent,
/*3928*/ 		@EngineHoursStart,
/*3929*/ 		@HobbsStart,
/*3930*/ 		@AirframeHoursStart,
/*3931*/ 		@ReturnTime,
/*3932*/ 		@ReturnDateTime_Local,
/*3933*/ 		@ReturnDateTime_UTC,
/*3934*/ 		@HobbsEnd,
/*3935*/ 		@AirframeHoursEnd,
/*3936*/ 		@EngineHoursEnd,
/*3937*/ 		@PostFlightFtiOK,
/*3938*/ 		@PostFlightTelemetryCheckComplete,
/*3939*/ 		@NacelleCheckBuildUp,
/*3940*/ 		@NacelleCheckDiscoloration,
/*3941*/ 		@IsApproved,
/*3942*/ 		@ApprovedBy,
/*3943*/ 		@UtcDateApproved,
/*3944*/ 		NEWID(),
/*3945*/ 		1,
/*3946*/ 		GetUTCDate(),
/*3947*/ 		GetUTCDate(),
/*3948*/ 		@StampUserName
/*3949*/ 		)
/*3950*/ 
/*3951*/ 	SELECT @FlightId = @@IDENTITY
/*3952*/ 	
/*3953*/ 	SELECT
/*3954*/ 		@NewConcurrencyId = ConcurrencyId,
/*3955*/ 		@NewUTCDate = UTCDateCreated
/*3956*/ 	FROM [dbo].[Flight]
/*3957*/ 	WHERE
/*3958*/ 		FlightId = @FlightId
/*3959*/ 
/*3960*/ 	IF @IsApproved = 1
/*3961*/ 	BEGIN
/*3962*/ 		UPDATE dbo.Aircraft
/*3963*/ 			SET 
/*3964*/ 				Aircraft.StampUserName = @StampUserName,
/*3965*/ 				Aircraft.UTCDateModified = GETUTCDATE(),
/*3966*/ 				Aircraft.AirframeHoursCurrent = 
/*3967*/ 					(SELECT MAX(Flight.AirframeHoursEnd) FROM Flight 
/*3968*/ 					 WHERE Flight.AircraftId = @AircraftId
/*3969*/ 					 AND Flight.IsActive = 1 AND Flight.IsDeleted = 0),
/*3970*/ 				Aircraft.AircraftEngineHoursCurrent = 
/*3971*/ 					(SELECT MAX(Flight.EngineHoursEnd) FROM Flight
/*3972*/ 					WHERE Flight.AircraftId = @AircraftId
/*3973*/ 					AND Flight.IsActive = 1 AND Flight.IsDeleted = 0)
/*3974*/ 		WHERE dbo.Aircraft.AircraftId = @AircraftId
/*3975*/ 	END
/*3976*/ END
/*3977*/ 
/*3978*/ GO
/*3979*/ SET ANSI_NULLS ON
/*3980*/ GO
/*3981*/ SET QUOTED_IDENTIFIER ON
/*3982*/ GO
/*3983*/ 
-- ===== listFlightInfos (database/FLT_Schema.sql:12307-12395) =====
/*12307*/ CREATE PROCEDURE [dbo].[listFlightInfos]
/*12308*/ 	@LocationId INT = 0,
/*12309*/ 	@AircraftId INT = 0,
/*12310*/ 	@AircraftTextMatch NVARCHAR(20) = '',
/*12311*/ 	@SchedRouteId Int = 0,
/*12312*/ 	@FlownRouteId INT = 0,
/*12313*/ 	@WorkShiftIndicatorId Int = 0,
/*12314*/ 	@FilterDateBegin VARCHAR(20) = '',
/*12315*/ 	@FilterDateEnd VARCHAR(20) = '',
/*12316*/ 	@IsApprovedFilter INT = -1,
/*12317*/ 	@IsActiveFilter int = -1, 
/*12318*/ 	@IsDeletedFilter int = 0, 
/*12319*/ 	@Start int = -1,
/*12320*/ 	@Count int = -1,
/*12321*/ 	@Total int OUTPUT
/*12322*/ AS
/*12323*/ BEGIN
/*12324*/ 	SET NOCOUNT ON
/*12325*/ 
/*12326*/ 	DECLARE @DateBegin DATETIME
/*12327*/ 	DECLARE @DateEnd DATETIME
/*12328*/ 	IF (LEN(@FilterDateBegin) <> 0)
/*12329*/ 		SELECT @DateBegin = CONVERT(DATETIME, @FilterDateBegin)
/*12330*/ 	ELSE
/*12331*/ 		SELECT @DateBegin = CONVERT(DATETIME, '1900-01-01')
/*12332*/ 		
/*12333*/ 	IF (LEN(@FilterDateEnd) <> 0)
/*12334*/ 		SELECT @DateEnd = CONVERT(DATETIME, @FilterDateEnd)
/*12335*/ 	ELSE
/*12336*/ 		SELECT @DateEnd = CONVERT(DATETIME, '2100-12-31')
/*12337*/ 	
/*12338*/ 
/*12339*/ 	
/*12340*/ 
/*12341*/ 	SELECT
/*12342*/ 		[dbo].[Flight].FlightId,
/*12343*/ 		[dbo].[Flight].LocationId,
/*12344*/ 		[dbo].[Location].[LocationName],
/*12345*/ 		[dbo].[Flight].[FlightDate],
/*12346*/ 		[dbo].[WorkShift].[StringValue] AS WorkShift,
/*12347*/ 		[dbo].[Aircraft].[MSN],
/*12348*/ 		[dbo].[Aircraft].[SerialNbr],
/*12349*/ 		[dbo].[Aircraft].[RegistrationNbr],
/*12350*/ 		[dbo].[Flight].[FlightDateSort],
/*12351*/ 		[dbo].[Flight].[DepartureTime],
/*12352*/ 		[dbo].[Flight].[Returntime],
/*12353*/ 		[dbo].[Flight].[AirframeHoursStart],
/*12354*/ 		[dbo].[Flight].[AirframeHoursEnd],
/*12355*/ 		[dbo].[Flight].[HobbsEnd] - [dbo].[Flight].[HobbsStart] AS FlightUsage,
/*12356*/ 		[dbo].[Flight].[IsApproved],
/*12357*/ 		[dbo].[Flight].[IsActive],
/*12358*/ 		[dbo].[Flight].[IsDeleted],
/*12359*/ 		[dbo].[Flight].[UTCDateCreated],
/*12360*/ 		[dbo].[Flight].[UTCDateModified]
/*12361*/ 	FROM 
/*12362*/ 		[dbo].[Flight]
/*12363*/ 		INNER JOIN [dbo].[Location] ON
/*12364*/ 			[dbo].[Location].[LocactionId] = [dbo].[Flight].[LocationId]
/*12365*/ 		INNER JOIN [dbo].[WorkShift] on
/*12366*/ 			[dbo].[WorkShift].[Id] = [dbo].[Flight].[WorkShiftIndicatorId]
/*12367*/ 		INNER JOIN [dbo].[Aircraft] ON
/*12368*/ 			[dbo].[Aircraft].[AircraftId] = [dbo].[Flight].[AircraftId]
/*12369*/ 	WHERE
/*12370*/ 	    ((@IsApprovedFilter = 1 AND [Flight].[IsApproved] = 1) OR (@IsApprovedFilter = 0 AND [Flight].[IsApproved] = 0) OR (@IsApprovedFilter = -1)) AND
/*12371*/ 		((@IsActiveFilter = 1 AND [Flight].[IsActive] = 1) OR (@IsActiveFilter = 0 AND [Flight].[IsActive] = 0) OR (@IsActiveFilter = -1)) AND 
/*12372*/ 		((@IsDeletedFilter = 1 AND [Flight].[IsDeleted] = 1) OR (@IsDeletedFilter = 0 AND [Flight].[IsDeleted] = 0) OR (@IsDeletedFilter = -1)) AND 
/*12373*/ 		((@AircraftId = 0) OR ([dbo].[Flight].[AircraftId] = @AircraftId)) AND 
/*12374*/ 		((@AircraftTextMatch = '') OR 
/*12375*/ 		 ([dbo].[Aircraft].[SerialNbr] LIKE @AircraftTextMatch) OR
/*12376*/ 		 ([dbo].[Aircraft].[RegistrationNbr] LIKE @AircraftTextMatch) OR 
/*12377*/ 		 ([dbo].[Aircraft].[MSN] LIKE @AircraftTextMatch) OR 
/*12378*/ 		 ([dbo].[Aircraft].[ShipNbr] LIKE @AircraftTextMatch)) AND
/*12379*/ 		((@LocationId = 0) OR ([dbo].[Flight].[LocationId] = @LocationId)) AND 
/*12380*/ 		((@SchedRouteId = 0) OR ([dbo].[Flight].[SchedRouteId] = @SchedRouteId)) AND 
/*12381*/ 		((@FlownRouteId = 0) OR ([dbo].[Flight].[FlownRouteId] = @FlownRouteId)) AND 
/*12382*/ 		((@WorkShiftIndicatorId = 0) OR ([dbo].[Flight].[WorkShiftIndicatorId] = @WorkShiftIndicatorId)) AND
/*12383*/ 		((CONVERT(DATETIME, Flight.FlightDate) >= @DateBegin) AND (CONVERT(DATETIME, Flight.Flightdate) <= @DateEnd))
/*12384*/ 	ORDER BY
/*12385*/ 		Aircraft.MSN,
/*12386*/ 		[Flight].[AirframeHoursEnd] DESC,
/*12387*/ 		dbo.Flight.flightdatesort DESC
/*12388*/ 
/*12389*/ END
/*12390*/ GO
/*12391*/ SET ANSI_NULLS ON
/*12392*/ GO
/*12393*/ SET QUOTED_IDENTIFIER ON
/*12394*/ GO
/*12395*/ 
-- ===== rptDailyUsage (database/FLT_Schema.sql:14282-14505) =====
/*14282*/ CREATE PROCEDURE [dbo].[rptDailyUsage]
/*14283*/ 	@ProgId INT,
/*14284*/ 	@LocationId INT = -1,
/*14285*/ 	@FlightDate DATETIME
/*14286*/ AS
/*14287*/ BEGIN
/*14288*/ 	SET NOCOUNT ON
/*14289*/ 
/*14290*/ 	CREATE TABLE #FleetAtLocationByDate (
/*14291*/ 		ID INTEGER IDENTITY PRIMARY KEY,
/*14292*/ 		AircraftLocationId INTEGER,
/*14293*/ 		AircraftId INTEGER,
/*14294*/ 		LocationId INTEGER,
/*14295*/ 		LocationGoalHours DECIMAL(9,1),
/*14296*/ 		EndTestDate DATETIME
/*14297*/ 		)
/*14298*/ 		
/*14299*/ 	INSERT INTO #FleetAtLocationByDate (
/*14300*/ 		AircraftLocationId,
/*14301*/ 		AircraftId,
/*14302*/ 		LocationId,
/*14303*/ 		LocationGoalHours,
/*14304*/ 		EndTestDate
/*14305*/ 		)
/*14306*/ 	SELECT 
/*14307*/ 		VL.AircraftLocationId,
/*14308*/ 		V.AircraftID,
/*14309*/ 		L.LocactionId,
/*14310*/ 		VL.RequiredUsage AS LocationGoalHours,
/*14311*/ 		CASE 
/*14312*/ 			WHEN (VL.ActEndOfTest <> NULL) THEN
/*14313*/ 				VL.ActEndOfTest
/*14314*/ 			WHEN (VL.EstEndOfTest <> NULL) THEN
/*14315*/ 				VL.EstEndOfTest
/*14316*/ 			ELSE
/*14317*/ 				NULL
/*14318*/ 		END AS EndTestDate
/*14319*/ 	FROM
/*14320*/ 		[dbo].[AircraftLocation] AS VL
/*14321*/ 		INNER JOIN [dbo].[Aircraft] AS V ON
/*14322*/ 			V.AircraftId = VL.AircraftId
/*14323*/ 		INNER JOIN [dbo].Location AS L ON
/*14324*/ 			L.LocactionId = VL.LocationId
/*14325*/ 	WHERE
/*14326*/ 		V.ProgId = @ProgId AND
/*14327*/ 		V.IsDeleted = 0 AND	V.IsActive = 1 AND
/*14328*/ 		((@LocationId = -1) OR (L.LocactionId = @LocationId)) AND
/*14329*/ 		((NOT (VL.ActEndOfTest IS NULL) AND (VL.ActEndOfTest >= @FlightDate)) OR
/*14330*/ 		 ((VL.ActEndOfTest IS NULL) AND NOT (VL.EstEndOfTest = NULL) AND (VL.EstEndOfTest >= @FlightDate)) OR
/*14331*/ 		 ((VL.ActEndOfTest IS NULL) AND (VL.EstEndOfTest IS NULL)))
/*14332*/ 		
/*14333*/ 	CREATE TABLE #FleetAtLocationOnDate (
/*14334*/ 		ID INTEGER IDENTITY PRIMARY KEY,
/*14335*/ 		AircraftLocationId INTEGER,
/*14336*/ 		AircraftId INTEGER,
/*14337*/ 		LocationId INTEGER,
/*14338*/ 		LocationGoalHours DECIMAL(9,1) NULL,
/*14339*/ 		EndTestDate DATETIME NULL
/*14340*/ 		)
/*14341*/ 	
/*14342*/ 	INSERT INTO #FleetAtLocationOnDate (
/*14343*/ 		AircraftLocationId,
/*14344*/ 		AircraftId,
/*14345*/ 		LocationId,
/*14346*/ 		LocationGoalHours,
/*14347*/ 		EndTestDate
/*14348*/ 	) 
/*14349*/ 	SELECT DISTINCT
/*14350*/ 		A.AircraftLocationId,
/*14351*/ 		A.AircraftId,
/*14352*/ 		A.LocationId,
/*14353*/ 		A.LocationGoalHours,
/*14354*/ 		A.EndTestDate
/*14355*/ 	FROM
/*14356*/ 		#FleetAtLocationByDate AS A
/*14357*/ 		INNER JOIN
/*14358*/ 			(SELECT
/*14359*/ 				AircraftId, 
/*14360*/ 				MIN(EndTestDate) AS EndTestDate
/*14361*/ 			 FROM
/*14362*/ 				#FleetAtLocationByDate
/*14363*/ 			 GROUP BY
/*14364*/ 				AircraftId) AS B ON
/*14365*/ 			A.AircraftId = B.AircraftId AND ((A.EndTestDate = B.EndTestDate) OR (A.EndTestDate IS NULL AND B.EndTestDate IS NULL))
/*14366*/ 
/*14367*/ 	CREATE TABLE #AircraftLocationHoursOnDate (
/*14368*/ 		ID INTEGER IDENTITY PRIMARY KEY,
/*14369*/ 		AircraftId INTEGER,
/*14370*/ 		LocationId INTEGER,
/*14371*/ 		DateLastRun DateTime,
/*14372*/ 		CurrentMeter DECIMAL(9,1),
/*14373*/ 		TotalFlightUsage DECIMAL(9,1)
/*14374*/ 	)
/*14375*/ 
/*14376*/ 	INSERT INTO #AircraftLocationHoursOnDate (
/*14377*/ 		AircraftId,
/*14378*/ 		LocationId,
/*14379*/ 		DateLastRun,
/*14380*/ 		CurrentMeter,
/*14381*/ 		TotalFlightUsage
/*14382*/ 	)
/*14383*/ 	SELECT
/*14384*/ 		Z.AircraftId,
/*14385*/ 		Z.LocationId,
/*14386*/ 		MAX(Z.FlightDateSort) AS DateLastRun,
/*14387*/ 		MAX(Z.AirframeHoursEnd) AS CurrentMeter,
/*14388*/ 		SUM(Z.FlightUsage) AS TotalFlightUsage
/*14389*/ 	FROM
/*14390*/ 		(SELECT
/*14391*/ 			T.AircraftId,
/*14392*/ 			T.LocationId,
/*14393*/ 			T.FlightDateSort,
/*14394*/ 			T.AirframeHoursEnd,
/*14395*/ 			FlightUsage = (T.AirframeHoursEnd - T.AirframeHoursStart)
/*14396*/ 		 FROM
/*14397*/ 			Flight AS T
/*14398*/ 			INNER JOIN #FleetAtLocationByDate AS A ON
/*14399*/ 				A.AircraftId = T.AircraftId AND A.LocationId = T.LocationId
/*14400*/ 		 WHERE
/*14401*/ 			Convert(DateTime, T.FlightDate) <= @FlightDate AND
/*14402*/ 			T.IsDeleted = 0 AND T.IsActive = 1) AS Z
/*14403*/ 	GROUP BY
/*14404*/ 		Z.AircraftId,
/*14405*/ 		Z.LocationId
/*14406*/ 
/*14407*/ 	CREATE TABLE #AircraftTotalHoursOnDate (
/*14408*/ 		ID INTEGER IDENTITY PRIMARY KEY,
/*14409*/ 		AircraftId INTEGER,
/*14410*/ 		TotalAircraftUsage DECIMAL(9,1)
/*14411*/ 	)
/*14412*/ 
/*14413*/ 	INSERT INTO #AircraftTotalHoursOnDate (
/*14414*/ 		AircraftId,
/*14415*/ 		TotalAircraftUsage
/*14416*/ 	)
/*14417*/ 	SELECT
/*14418*/ 		Z.AircraftId,
/*14419*/ 		SUM(Z.FlightUsage) AS TotalFlightUsage
/*14420*/ 	FROM
/*14421*/ 		(SELECT
/*14422*/ 			T.AircraftId,
/*14423*/ 			FlightUsage = (T.AirframeHoursEnd - T.AirframeHoursStart)
/*14424*/ 		 FROM
/*14425*/ 			Flight AS T
/*14426*/ 			INNER JOIN #FleetAtLocationByDate AS A ON
/*14427*/ 				A.AircraftId = T.AircraftId AND A.LocationId = T.LocationId
/*14428*/ 		 WHERE
/*14429*/ 			Convert(DateTime, T.FlightDate) <= @FlightDate AND
/*14430*/ 			T.IsDeleted = 0 AND T.IsActive = 1) AS Z
/*14431*/ 	GROUP BY
/*14432*/ 		Z.AircraftId
/*14433*/ 
/*14434*/ 	SELECT
/*14435*/ 		Program.Progid,
/*14436*/ 		Program.ProgName,
/*14437*/ 		A.AircraftLocationId,
/*14438*/ 		A.LocationId,
/*14439*/ 		Location.LocationName,
/*14440*/ 		@FlightDate AS FlightDate,
/*14441*/ 		A.AircraftId,
/*14442*/ 		Aircraft.MSN,
/*14443*/ 		Model.StringValue AS ModelName,
/*14444*/ 		ISNULL(Test.StringValue, 'None Assigned') AS TestName,
/*14445*/ 		ISNULL(B.FlightId, 0) AS FlightId,
/*14446*/ 		ISNULL(B.AirframeHoursEnd, 0) - ISNULL(B.AirframeHoursStart, 0) AS HoursOnDate,
/*14447*/ 		C.DateLastRun,
/*14448*/ 		ISNULL(C.CurrentMeter, Aircraft.AirframeHoursStart) AS LastMeterReading,
/*14449*/ 		C.TotalFlightUsage AS LocationCurrentHours,
/*14450*/ 		CASE ISNULL(A.LocationGoalHours, 0)
/*14451*/ 			WHEN 0 THEN
/*14452*/ 				0
/*14453*/ 			ELSE
/*14454*/ 				CONVERT(FLOAT, ((100 * ISNULL(C.TotalFlightUsage, 0)) / A.LocationGoalHours))
/*14455*/ 			END AS LocationPercentComplete,
/*14456*/ 		A.LocationGoalHours,
/*14457*/ 		A.EndTestDate AS LocationEndTestDate,
/*14458*/ 		D.TotalAircraftUsage AS AircraftCurrentUsage,
/*14459*/ 		CASE ISNULL(Aircraft.TotalRequiredUsage, 0)
/*14460*/ 			WHEN 0 THEN
/*14461*/ 				0
/*14462*/ 			ELSE
/*14463*/ 				CONVERT(FLOAT, ((100 * ISNULL(D.TotalAircraftUsage, 0)) / Aircraft.TotalRequiredUsage))
/*14464*/ 			END AS ProgramPercentComplete,
/*14465*/ 		CASE
/*14466*/ 			WHEN NOT(Aircraft.EstEndOfTesting IS NULL) THEN
/*14467*/ 				Aircraft.EstEndOfTesting
/*14468*/ 			ELSE
/*14469*/ 				NULL
/*14470*/ 		END AS ProgramEndTestDate,
/*14471*/ 		Aircraft.TotalRequiredUsage
/*14472*/ 	FROM
/*14473*/ 		#FleetAtLocationOnDate AS A
/*14474*/ 		INNER JOIN Aircraft ON Aircraft.AircraftId = A.AircraftId
/*14475*/ 		INNER JOIN Program ON Program.ProgId = Aircraft.ProgId
/*14476*/ 		INNER JOIN Model ON Model.ID = Aircraft.ModelId
/*14477*/ 		LEFT OUTER JOIN AircraftTestXref ON AircraftTestXRef.AircraftId = Aircraft.AircraftId
/*14478*/ 		LEFT OUTER JOIN Test ON Test.ID = AircraftTestXref.TestId
/*14479*/ 		INNER JOIN Location ON Location.LocactionId = A.LocationId
/*14480*/ 		LEFT OUTER JOIN Flight AS B ON B.AircraftId = A.AircraftId AND B.LocationId = A.LocationId AND CONVERT(DATETIME, b.FlightDate) = @FlightDate
/*14481*/ 		LEFT OUTER JOIN #AircraftLocationHoursOnDate AS C ON C.AircraftId = A.AircraftId AND C.LocationId = A.LocationId
/*14482*/ 		LEFT OUTER JOIN #AircraftTotalHoursOnDate AS D ON D.AircraftId = A.AircraftId
/*14483*/ 	WHERE
/*14484*/ 		Program.IsDeleted = 0 AND Program.IsActive = 1 AND
/*14485*/ 		Aircraft.IsDeleted = 0 AND Aircraft.IsActive = 1 AND
/*14486*/ 		ISNULL(Test.IsActive, 1) = 1 AND
/*14487*/ 		ISNULL(B.IsDeleted, 0) = 0 AND ISNULL(B.IsActive, 1) = 1
/*14488*/ 	ORDER BY
/*14489*/ 		Program.ProgName,
/*14490*/ 		Program.ProgId,
/*14491*/ 		Aircraft.MSN,
/*14492*/ 		Aircraft.AircraftId
/*14493*/ 		
/*14494*/ 	DROP TABLE #FleetAtLocationOnDate
/*14495*/ 	DROP TABLE #FleetAtLocationByDate
/*14496*/ 	DROP TABLE #AircraftLocationHoursOnDate
/*14497*/ 	
/*14498*/ END
/*14499*/ 
/*14500*/ SET ANSI_NULLS ON
/*14501*/ GO
/*14502*/ SET ANSI_NULLS ON
/*14503*/ GO
/*14504*/ SET QUOTED_IDENTIFIER ON
/*14505*/ GO
-- ===== rptFuelBurnByRefill (database/FLT_Schema.sql:14627-15022) =====
/*14627*/ CREATE PROCEDURE [dbo].[rptFuelBurnByRefill]
/*14628*/ 	@ProgId INT,
/*14629*/ 	@AircraftId INT = -1,
/*14630*/ 	@DateFrom DATETIME,
/*14631*/ 	@DateThru DATETIME,
/*14632*/ 	@LiquidGroupId INTEGER 
/*14633*/ AS
/*14634*/ BEGIN
/*14635*/ 	SET NOCOUNT ON
/*14636*/ 
/*14637*/ 	CREATE TABLE #flights (
/*14638*/ 		ID INT PRIMARY KEY identity(1,1),
/*14639*/ 		ProgName NVARCHAR(255),
/*14640*/ 		AircraftId INT,
/*14641*/ 		MSN VARCHAR(20),
/*14642*/ 		RegistrationNbr VARCHAR(20),
/*14643*/ 		FlightId INT,
/*14644*/ 		FlightDate DATETIME,
/*14645*/ 		LocationName NVARCHAR(255),
/*14646*/ 		WorkShiftName NVARCHAR(255),
/*14647*/ 		SchedRouteName NVARCHAR(255),
/*14648*/ 		FlownRouteName NVARCHAR(255),
/*14649*/ 		FlightMeterStart DECIMAL(9,1),
/*14650*/ 		FlightMeterEnd DECIMAL(9,1),
/*14651*/ 		MeterUnit NVARCHAR(255),
/*14652*/ 		LiquidFillId INT,
/*14653*/ 		HobbsReading DECIMAL(9,1),
/*14654*/ 		AirframeHoursReading DECIMAL(9,1),
/*14655*/ 		LiquidGroup NVARCHAR(20),
/*14656*/ 		LiquidAmt DECIMAL(6,3),
/*14657*/ 		LiquidUnit NVARCHAR(255)
/*14658*/ 		)
/*14659*/ 		
/*14660*/ 	CREATE TABLE #fills (
/*14661*/ 		ID INT PRIMARY KEY IDENTITY(1,1),
/*14662*/ 		ProgName NVARCHAR(255),
/*14663*/ 		AircraftId INT,
/*14664*/ 		MSN VARCHAR(20),
/*14665*/ 		RegistrationNbr VARCHAR(20),
/*14666*/ 		FlightDate DATETIME,
/*14667*/ 		LocationName NVARCHAR(20),
/*14668*/ 		WorkShiftName NVARCHAR(10),
/*14669*/ 		SchedRouteName NVARCHAR(30),
/*14670*/ 		FlownRouteName NVARCHAR(30),
/*14671*/ 		FlightMeterSort DECIMAL(9,1),
/*14672*/ 		FlightMeterStart DECIMAL(9,1) NULL,
/*14673*/ 		FlightMeterEnd DECIMAL(9,1) NULL,
/*14674*/ 		FlightAirtime DECIMAL(9,1) NULL,
/*14675*/ 		TotalFlightAirtime DECIMAL(9,1) NULL,
/*14676*/ 		MeterUnit NVARCHAR(20),
/*14677*/ 		LiquidFillId INT NULL,
/*14678*/ 		RefillMeterLast DECIMAL(9,1) NULL,
/*14679*/ 		RefillMeterCurrent DECIMAL(9,1) NULL,
/*14680*/ 		RefillAirtime DECIMAL(9,1) NULL,
/*14681*/ 		LiquidGroup NVARCHAR(20) NULL,
/*14682*/ 		LiquidAmt DECIMAL(18,3) NULL,
/*14683*/ 		LiquidUnit NVARCHAR(20) NULL,
/*14684*/ 		Usage DECIMAL(12,3) NULL,
/*14685*/ 		TotalRefillAirtime DECIMAL(9,1) NULL,
/*14686*/ 		TotalLiquidAmt DECIMAL(18,3) NULL,
/*14687*/ 		AvgUsage DECIMAL(6,3) NULL
/*14688*/ 		)
/*14689*/ 		
/*14690*/ 	INSERT INTO #flights (
/*14691*/ 		ProgName,
/*14692*/ 		AircraftId,
/*14693*/ 		MSN,
/*14694*/ 		RegistrationNbr,
/*14695*/ 		FlightId,
/*14696*/ 		FlightDate,
/*14697*/ 		LocationName,
/*14698*/ 		WorkShiftName,
/*14699*/ 		SchedRouteName,
/*14700*/ 		FlownRouteName,
/*14701*/ 		FlightMeterStart,
/*14702*/ 		FlightMeterEnd,
/*14703*/ 		LiquidFillId,
/*14704*/ 		HobbsReading,
/*14705*/ 		AirframeHoursReading,
/*14706*/ 		MeterUnit,
/*14707*/ 		LiquidGroup,
/*14708*/ 		LiquidAmt,
/*14709*/ 		LiquidUnit
/*14710*/ 		)
/*14711*/ 	SELECT
/*14712*/ 		P.ProgName AS ProgName,
/*14713*/ 		V.AircraftId,
/*14714*/ 		V.MSN AS MSN,
/*14715*/ 		V.RegistrationNbr AS RegistrationNbr,
/*14716*/ 		T.FlightId,
/*14717*/ 		Convert(DateTime, T.FlightDateSort) AS FlightDate,
/*14718*/ 		L.LocationName AS LocationName,
/*14719*/ 		WS.StringValue AS WorkShiftName,
/*14720*/ 		SR.Name AS SchedRouteName,
/*14721*/ 		DR.Name AS FlownRouteName,
/*14722*/ 		T.AirframeHoursStart,
/*14723*/ 		T.AirframeHoursEnd,
/*14724*/ 		ISNULL(LF.LiquidFillId, 0) AS LiquidFillId,
/*14725*/ 		ISNULL(LF.HobbsReading, 0) AS HobbsReading,
/*14726*/ 		ISNULL(LF.AirframeHoursReading, 0) AS AirframeHoursReading,
/*14727*/ 		ISNULL(LeU.StringValue, '') AS MeterUnit,
/*14728*/ 		ISNULL(LG.StringValue, '') AS LiquidGroup,
/*14729*/ 		ISNULL(LF.LiquidAmt, 0) AS LiquidAmt,
/*14730*/ 		ISNULL(LiU.StringValue, '') AS LiquidUnit
/*14731*/ 	FROM
/*14732*/ 		Aircraft AS V
/*14733*/ 		INNER JOIN Program AS P ON 
/*14734*/ 			P.ProgId = V.Progid
/*14735*/ 		INNER JOIN Flight AS T ON
/*14736*/ 			T.AircraftId = V.AircraftId 
/*14737*/ 		INNER JOIN dbo.[Route] AS SR ON
/*14738*/ 			SR.RouteId = T.SchedRouteId
/*14739*/ 		INNER JOIN dbo.[Route] AS DR ON
/*14740*/ 			DR.RouteId = T.FlownRouteId
/*14741*/ 		INNER JOIN dbo.WorkShift AS WS ON
/*14742*/ 			WS.ID = T.WorkShiftIndicatorId
/*14743*/ 		INNER JOIN LengthUnit AS LeU ON
/*14744*/ 			LeU.ID = T.MeterUnitId
/*14745*/ 		LEFT OUTER JOIN LiquidFill AS LF ON 
/*14746*/ 			LF.FlightId = T.FlightId
/*14747*/ 			AND LF.LiquidGroupId = @LiquidGroupId
/*14748*/ 			AND (ISNULL(LF.IsDeleted, 0) = 0 AND ISNULL(LF.IsActive, 1) = 1) 
/*14749*/ 		LEFT OUTER JOIN LiquidGroup AS LG ON
/*14750*/ 			LG.ID = LF.LiquidGroupId
/*14751*/ 		LEFT OUTER JOIN LiquidUnit AS LiU ON
/*14752*/ 			LiU.ID = LF.LiquidUnitId
/*14753*/ 		INNER JOIN Location AS L ON
/*14754*/ 			L.LocactionId = T.LocationId
/*14755*/ 	WHERE
/*14756*/ 		P.ProgId = @ProgId AND
/*14757*/ 		((@AircraftId = -1) OR (V.AircraftId = @AircraftId)) AND
/*14758*/ 		(P.IsDeleted = 0) AND
/*14759*/ 		(V.IsDeleted = 0 AND V.IsActive = 1) AND
/*14760*/ 		(T.IsDeleted = 0 AND T.IsActive = 1) AND
/*14761*/ 		(ISNULL(L.IsDeleted, 0) = 0)
/*14762*/ 	ORDER BY
/*14763*/ 		V.AircraftId,
/*14764*/ 		T.HobbsStart,
/*14765*/ 		T.FlightDateSort,
/*14766*/ 		T.FlightId,
/*14767*/ 		LF.AirframeHoursReading
/*14768*/ 
/*14769*/ 	DECLARE @ID INT
/*14770*/ 	DECLARE @ProgName NVARCHAR(255)
/*14771*/ 	DECLARE @cAircraftId INT
/*14772*/ 	DECLARE @MSN VARCHAR(20)
/*14773*/ 	DECLARE @RegistrationNbr VARCHAR(20)
/*14774*/ 	DECLARE @FlightId INT
/*14775*/ 	DECLARE @FlightDate DATETIME
/*14776*/ 	DECLARE @LocationName NVARCHAR(255)
/*14777*/ 	DECLARE @WorkShiftName NVARCHAR(10)
/*14778*/ 	DECLARE @SchedRouteName NVARCHAR(20)
/*14779*/ 	DECLARE @FlownRouteName NVARCHAR(20)
/*14780*/ 	DECLARE @FlightMeterStart DECIMAL(9,1)
/*14781*/ 	DECLARE @FlightMeterEnd DECIMAL(9,1)
/*14782*/ 	DECLARE @MeterUnit AS NVARCHAR(255)
/*14783*/ 	DECLARE @LiquidFillId INT
/*14784*/ 	DECLARE @HobbsReading DECIMAL(9,1)
/*14785*/ 	DECLARE @AirframeHoursReading DECIMAL(9,1)
/*14786*/ 	DECLARE @LiquidGroup AS NVARCHAR(20)
/*14787*/ 	DECLARE @LiquidAmt AS DECIMAL(6,3)
/*14788*/ 	DECLARE @LiquidUnit AS NVARCHAR(255)
/*14789*/ 	
/*14790*/ 	DECLARE @LastAircraftId INT
/*14791*/ 	DECLARE @LastFlightId INT
/*14792*/ 	DECLARE @ReFillMeterLast DECIMAL(18,1)
/*14793*/ 	DECLARE @ReFillMeterCurrent DECIMAL(18,1)
/*14794*/ 	DECLARE @TotalFlightAirtime DECIMAL(18,1)
/*14795*/ 	DECLARE @TotalRefillAirtime DECIMAL(18,1)
/*14796*/ 	DECLARE @TotalLiquidAmt DECIMAL(18,3)
/*14797*/ 	
/*14798*/ 	
/*14799*/ 	DECLARE curFlight CURSOR FOR
/*14800*/ 		SELECT *
/*14801*/ 		FROM #flights 
/*14802*/ 		ORDER BY 
/*14803*/ 			AircraftId, 
/*14804*/ 			FlightDate, 
/*14805*/ 			FlightMeterStart,
/*14806*/ 			AirframeHoursReading
/*14807*/ 	
/*14808*/ 	OPEN curFlight
/*14809*/ 	FETCH NEXT FROM curFlight INTO 
/*14810*/ 		@ID,
/*14811*/ 		@ProgName,
/*14812*/ 		@cAircraftId,
/*14813*/ 		@MSN,
/*14814*/ 		@RegistrationNbr,
/*14815*/ 		@FlightId,
/*14816*/ 		@FlightDate,
/*14817*/ 		@LocationName,
/*14818*/ 		@WorkShiftName,
/*14819*/ 		@SchedRouteName,
/*14820*/ 		@FlownRouteName,
/*14821*/ 		@FlightMeterStart,
/*14822*/ 		@FlightMeterEnd,
/*14823*/ 		@MeterUnit,
/*14824*/ 		@LiquidFillId,
/*14825*/ 		@HobbsReading,
/*14826*/ 		@AirframeHoursReading,
/*14827*/ 		@LiquidGroup,
/*14828*/ 		@LiquidAmt,
/*14829*/ 		@LiquidUnit
/*14830*/ 	
/*14831*/ 	SELECT @LastAircraftId = @cAircraftId
/*14832*/ 	SELECT @LastFlightId = 0
/*14833*/ 	SELECT @TotalFlightAirtime = 0
/*14834*/ 	SELECT @TotalRefillAirtime = 0
/*14835*/ 	SELECT @TotalLiquidAmt = 0
/*14836*/ 	
/*14837*/ 	SELECT @RefillMeterLast = @FlightMeterStart	
/*14838*/ 	
/*14839*/ 	WHILE @@FETCH_STATUS = 0
/*14840*/ 	BEGIN
/*14841*/ 		
/*14842*/ 		IF @cAircraftId <> @LastAircraftId 
/*14843*/ 		BEGIN 
/*14844*/ 			SELECT @RefillMeterLast = @FlightMeterStart
/*14845*/ 			SELECT @TotalFlightAirtime = 0
/*14846*/ 			SELECT @TotalRefillAirtime = 0
/*14847*/ 			SELECT @TotalLiquidAmt = 0
/*14848*/ 		END
/*14849*/ 
/*14850*/ 		IF @LastFlightid <> @FlightID 
/*14851*/ 		BEGIN 
/*14852*/ 			SELECT @TotalFlightAirtime = @TotalFlightAirtime + (@FlightMeterEnd - @FlightMeterStart)
/*14853*/ 		END
/*14854*/ 		
/*14855*/ 		IF @LiquidFillId <> 0 
/*14856*/ 		BEGIN
/*14857*/ 			
/*14858*/ 			IF IsNull(@AirframeHoursReading, 0) = 0
/*14859*/ 				SELECT @RefillMeterCurrent = IsNull(@HobbsReading, 0)
/*14860*/ 			ELSE
/*14861*/ 				SELECT @RefillMeterCurrent = IsNull(@AirframeHoursReading, 0)
/*14862*/ 			
/*14863*/ 			SELECT @TotalRefillAirtime = @TotalRefillAirtime + (@RefillMeterCurrent - @ReFillMeterLast)			
/*14864*/ 			SELECT @TotalLiquidAmt = @TotalLiquidAmt + IsNull(@LiquidAmt, 0)
/*14865*/ 			
/*14866*/ 
/*14867*/ 			INSERT INTO #fills (
/*14868*/ 				ProgName,
/*14869*/ 				AircraftId,
/*14870*/ 				MSN,
/*14871*/ 				RegistrationNbr,
/*14872*/ 				FlightDate,
/*14873*/ 				LocationName,
/*14874*/ 				WorkShiftName,
/*14875*/ 				SchedRouteName,
/*14876*/ 				FlownRouteName,
/*14877*/ 				FlightMeterSort,
/*14878*/ 				FlightMeterStart,
/*14879*/ 				FlightMeterEnd,
/*14880*/ 				FlightAirtime,
/*14881*/ 				TotalFlightAirtime,
/*14882*/ 				MeterUnit,
/*14883*/ 				LiquidFillId,
/*14884*/ 				RefillMeterLast,
/*14885*/ 				RefillMeterCurrent,
/*14886*/ 				RefillAirtime,
/*14887*/ 				LiquidGroup,
/*14888*/ 				LiquidAmt,
/*14889*/ 				LiquidUnit,
/*14890*/ 				Usage,
/*14891*/ 				TotalRefillAirtime,
/*14892*/ 				TotalLiquidAmt,
/*14893*/ 				AvgUsage
/*14894*/ 				)
/*14895*/ 			VALUES (
/*14896*/ 				@ProgName,
/*14897*/ 				@cAircraftId,
/*14898*/ 				@MSN,
/*14899*/ 				@RegistrationNbr,
/*14900*/ 				@FlightDate,
/*14901*/ 				@LocationName,
/*14902*/ 				@WorkShiftName,
/*14903*/ 				@SchedRouteName,
/*14904*/ 				@FlownRouteName,
/*14905*/ 				@FlightMeterEnd,
/*14906*/ 				CASE
/*14907*/ 					WHEN @LastFlightid = @FlightId THEN NULL
/*14908*/ 					ELSE @FlightMeterStart
/*14909*/ 				END,
/*14910*/ 				CASE
/*14911*/ 					WHEN @LastFlightid = @FlightId THEN NULL
/*14912*/ 					ELSE @FlightMeterEnd
/*14913*/ 				END,
/*14914*/ 				CASE
/*14915*/ 					WHEN @LastFlightId = @FlightId THEN NULL
/*14916*/ 					ELSE @FlightMeterEnd - @FlightMeterStart
/*14917*/ 				END,
/*14918*/ 				CASE
/*14919*/ 					WHEN @LastFlightId = @FlightId THEN NULL
/*14920*/ 					ELSE @TotalFlightAirtime
/*14921*/ 				END, 
/*14922*/ 				@MeterUnit,
/*14923*/ 				@LiquidFillId,
/*14924*/ 				@RefillMeterLast,
/*14925*/ 				@ReFillMeterCurrent,
/*14926*/ 				@ReFillMeterCurrent - @RefillMeterLast,
/*14927*/ 				@LiquidGroup,
/*14928*/ 				@LiquidAmt,
/*14929*/ 				@LiquidUnit, 
/*14930*/ 				CASE 
/*14931*/ 					WHEN @LiquidAmt = 0 THEN 0
/*14932*/ 					ELSE (@ReFillMeterCurrent - @RefillMeterLast) / @LiquidAmt	
/*14933*/ 				END,
/*14934*/ 				@TotalRefillAirtime,
/*14935*/ 				@TotalLiquidAmt,
/*14936*/ 				CASE
/*14937*/ 					WHEN IsNull(@TotalLiquidAmt, 0) = 0 then 0
/*14938*/ 					ELSE @TotalRefillAirtime / @TotalLiquidAmt
/*14939*/ 				END
/*14940*/ 				)
/*14941*/ 			
/*14942*/ 			SELECT @ReFillMeterLast = @ReFillMeterCurrent
/*14943*/ 		END
/*14944*/ 		ELSE
/*14945*/ 		BEGIN
/*14946*/ 			INSERT INTO #fills (
/*14947*/ 				ProgName,
/*14948*/ 				AircraftId,
/*14949*/ 				MSN,
/*14950*/ 				RegistrationNbr,
/*14951*/ 				FlightDate,
/*14952*/ 				LocationName,
/*14953*/ 				WorkShiftName,
/*14954*/ 				SchedRouteName,
/*14955*/ 				FlownRouteName,
/*14956*/ 				FlightMeterSort,
/*14957*/ 				FlightMeterStart,
/*14958*/ 				FlightMeterEnd,
/*14959*/ 				FlightAirtime,
/*14960*/ 				TotalFlightAirtime,
/*14961*/ 				MeterUnit		
/*14962*/ 				)
/*14963*/ 			VALUES (
/*14964*/ 				@ProgName,
/*14965*/ 				@cAircraftId,
/*14966*/ 				@MSN,
/*14967*/ 				@RegistrationNbr,
/*14968*/ 				@FlightDate,
/*14969*/ 				@LocationName,
/*14970*/ 				@WorkShiftName,
/*14971*/ 				@SchedRouteName,
/*14972*/ 				@FlownRouteName,
/*14973*/ 				@FlightMeterEnd,
/*14974*/ 				@FlightMeterStart,
/*14975*/ 				@FlightMeterEnd,
/*14976*/ 				@FlightMeterEnd - @FlightMeterStart,
/*14977*/ 				@TotalFlightAirtime,
/*14978*/ 				@MeterUnit
/*14979*/ 				)			
/*14980*/ 		END
/*14981*/ 		SELECT @LastAircraftId = @cAircraftId
/*14982*/ 		SELECT @LastFlightId = @FlightId
/*14983*/ 		
/*14984*/ 		FETCH NEXT FROM curFlight INTO 
/*14985*/ 			@ID,
/*14986*/ 			@ProgName,
/*14987*/ 			@cAircraftId,
/*14988*/ 			@MSN,
/*14989*/ 			@RegistrationNbr,
/*14990*/ 			@FlightId,
/*14991*/ 			@FlightDate,
/*14992*/ 			@LocationName,
/*14993*/ 			@WorkShiftName,
/*14994*/ 			@SchedRouteName,
/*14995*/ 			@FlownRouteName,
/*14996*/ 			@FlightMeterStart,
/*14997*/ 			@FlightMeterEnd,
/*14998*/ 			@MeterUnit,
/*14999*/ 			@LiquidFillId,
/*15000*/ 			@HobbsReading,
/*15001*/ 			@AirframeHoursReading,
/*15002*/ 			@LiquidGroup,
/*15003*/ 			@LiquidAmt,
/*15004*/ 			@LiquidUnit
/*15005*/ 		
/*15006*/ 	END
/*15007*/ 	
/*15008*/ 	CLOSE curFlight
/*15009*/ 	DEALLOCATE curFlight
/*15010*/ 	
/*15011*/ 	SELECT * FROM #fills
/*15012*/ 	WHERE ((FlightDate >= @DateFrom ) AND (FlightDate <= @DateThru))
/*15013*/ 
/*15014*/ 	DROP TABLE #flights
/*15015*/ 	DROP TABLE #fills
/*15016*/ END
/*15017*/ 
/*15018*/ GO
/*15019*/ SET ANSI_NULLS ON
/*15020*/ GO
/*15021*/ SET QUOTED_IDENTIFIER ON
/*15022*/ GO
-- ===== rptFlightData (database/FLT_Schema.sql:15023-15105) =====
/*15023*/ CREATE PROCEDURE [dbo].[rptFlightData]
/*15024*/ 	@ProgId INT,
/*15025*/ 	@LocationId INT = 0,
/*15026*/ 	@AircraftId INT = 0,
/*15027*/ 	@DateRangeStart DATETIME = NULL,
/*15028*/ 	@DateRangeEnd DATETIME = NULL,
/*15029*/ 	@FuelLiquidGroupId INT = 0,
/*15030*/ 	@OilLiquidGroupId INT = 0,
/*15031*/ 	@FluidsLiquidGroupId INT = 0
/*15032*/ AS
/*15033*/ BEGIN
/*15034*/ 	SET NOCOUNT ON
/*15035*/ SELECT
/*15036*/ 	P.ProgName,
/*15037*/ 	V.AircraftId,
/*15038*/ 	V.MSN,
/*15039*/ 	V.RegistrationNbr,
/*15040*/ 	T.FlightId,
/*15041*/ 	T.FlightDate,
/*15042*/     WS.StringValue as Shift,
/*15043*/     T.DepartureTime,
/*15044*/     T.ReturnTime,
/*15045*/ 	L.LocationName,
/*15046*/     SR.Name as SchedRouteName,
/*15047*/ 	DR.Name as FlownRouteName,
/*15048*/     DV.StringValue as PilotName,
/*15049*/ 	T.AirframeHoursStart AS MeterStart,
/*15050*/ 	T.AirframeHoursEnd AS MeterEnd,
/*15051*/ 	DailyHours = (T.AirframeHoursEnd - T.AirframeHoursStart),
/*15052*/     isnull(LF1.LiquidAmt,0) as Fuel,
/*15053*/     isnull(LF2.LiquidAmt,0) as Oil,
/*15054*/     isnull(LF3.LiquidAmt,0) as Fluids,
/*15055*/     isnull(VC.StringValue,'') as Component,
/*15056*/     isnull(TC.PilotComment,'') as PilotComment,
/*15057*/ 	isnull(TC.CommentRating,0) as CommentRating
/*15058*/ FROM
/*15059*/ 	Aircraft AS V
/*15060*/ 	INNER JOIN Program AS P ON 
/*15061*/ 		P.ProgId = V.Progid
/*15062*/ 	INNER JOIN Flight AS T ON
/*15063*/ 		T.AircraftId = V.AircraftId 
/*15064*/ 	LEFT OUTER JOIN WorkShift AS WS ON
/*15065*/ 		WS.Id = T.WorkShiftIndicatorId
/*15066*/ 	LEFT OUTER JOIN Location AS L ON
/*15067*/ 		L.LocactionId = T.LocationId
/*15068*/ 	LEFT OUTER JOIN Route AS SR ON
/*15069*/ 		SR.RouteId = T.SchedRouteId
/*15070*/ 	LEFT OUTER JOIN Route AS DR ON
/*15071*/ 		DR.RouteId = T.FlownRouteId
/*15072*/ 	LEFT OUTER JOIN Pilot AS DV ON
/*15073*/ 		DV.Id = T.PilotId
/*15074*/ 	LEFT OUTER JOIN (SELECT FlightId, LiquidGroupId, SUM(LiquidAmt) AS LiquidAmt FROM LiquidFill WHERE isActive = 1 AND Isdeleted = 0 GROUP BY FlightId, LiquidGroupId) AS LF1 ON 
/*15075*/ 		LF1.FlightId = T.FlightId
/*15076*/ 		AND LF1.LiquidGroupId = @FuelLiquidGroupId
/*15077*/ 	LEFT OUTER JOIN (SELECT FlightId, LiquidGroupId, SUM(LiquidAmt) AS LiquidAmt FROM LiquidFill WHERE isactive = 1 AND isdeleted = 0 GROUP BY FlightId, LiquidGroupId) AS LF2 ON 
/*15078*/ 		LF2.FlightId = T.FlightId
/*15079*/ 		AND LF2.LiquidGroupId = @OilLiquidGroupId
/*15080*/ 	LEFT OUTER JOIN (SELECT FlightId, LiquidGroupId, SUM(LiquidAmt) AS LiquidAmt FROM LiquidFill WHERE isactive = 1 AND isdeleted = 0 GROUP BY FlightId, LiquidGroupId) AS LF3 ON 
/*15081*/ 		LF3.FlightId = T.FlightId
/*15082*/ 		AND LF3.LiquidGroupId = @FluidsLiquidGroupId
/*15083*/ 	LEFT OUTER JOIN FlightComment AS TC ON 
/*15084*/ 		TC.FlightId = T.FlightId
/*15085*/ 	LEFT OUTER JOIN AircraftComponent AS VC ON 
/*15086*/ 		VC.Id = TC.ComponentId
/*15087*/ WHERE
/*15088*/ 	P.ProgId = @ProgId 
/*15089*/ 	AND ((@LocationId = 0) OR (L.LocactionId = @LocationId))
/*15090*/ 	AND ((@DateRangeStart IS NULL) OR (@DateRangeStart <= CONVERT(DATETIME, T.FlightDate)))
/*15091*/ 	AND ((@DateRangeEnd IS NULL) OR (@DateRangeEnd >= CONVERT(DATETIME, T.FlightDate)))
/*15092*/ 	AND ((@AircraftId = 0) OR (V.AircraftId = @AircraftId))
/*15093*/ 	AND (P.IsDeleted = 0 AND P.IsActive = 1)
/*15094*/ 	AND (V.IsDeleted = 0 AND P.IsActive = 1)
/*15095*/ 	AND (T.IsDeleted = 0 AND T.IsActive = 1)
/*15096*/ ORDER BY
/*15097*/ 	T.AirframeHoursStart,
/*15098*/ 	T.FlightDateSort,
/*15099*/ 	T.DepartureTime
/*15100*/ END
/*15101*/ GO
/*15102*/ SET ANSI_NULLS ON
/*15103*/ GO
/*15104*/ SET QUOTED_IDENTIFIER ON
/*15105*/ GO
-- ===== rptFlightOutliers (database/FLT_Schema.sql:15106-15244) =====
/*15106*/ CREATE PROCEDURE [dbo].[rptFlightOutliers] 
/*15107*/ 	@ProgId INT,
/*15108*/ 	@DateBegin VARCHAR(10),
/*15109*/ 	@DateEnd VARCHAR(10),
/*15110*/ 	@NbrOfStDevs INT
/*15111*/ AS
/*15112*/ 
/*15113*/ SET NOCOUNT ON
/*15114*/ 
/*15115*/ CREATE TABLE #tempStats (
/*15116*/ 	tempId INT IDENTITY,
/*15117*/ 	LocationId INT, 
/*15118*/ 	RouteId INT,
/*15119*/ 	MeterUnitId INT,
/*15120*/ 	FlightCount INT,
/*15121*/ 	FlightMinutesMin INT,
/*15122*/ 	FlightMinutesMax INT,
/*15123*/ 	FlightMinutesAvg INT,
/*15124*/ 	FlightMinutesStDev INT,
/*15125*/ 	FlightAirtimeMin DECIMAL(9,1),
/*15126*/ 	FlightAirtimeMax DECIMAL(9,1),
/*15127*/ 	FlightAirtimeAvg DECIMAL(9,1),
/*15128*/ 	FlightAirtimeStDev DECIMAL(9,1)
/*15129*/ 	)
/*15130*/ INSERT INTO #tempStats (
/*15131*/ 	LocationId,
/*15132*/ 	RouteId,
/*15133*/ 	MeterUnitId,
/*15134*/ 	FlightCount, 
/*15135*/ 	FlightMinutesMin,
/*15136*/ 	FlightMinutesMax,
/*15137*/ 	FlightMinutesAvg,
/*15138*/ 	FlightMinutesStDev,
/*15139*/ 	FlightAirtimeMin,
/*15140*/ 	FlightAirtimeMax,
/*15141*/ 	FlightAirtimeAvg,
/*15142*/ 	FlightAirtimeStDev
/*15143*/ 	)	
/*15144*/ SELECT 
/*15145*/ 	Location.LocactionId,
/*15146*/ 	A.FlownRouteId,
/*15147*/ 	A.MeterUnitId,
/*15148*/ 	COUNT(A.FlightId) AS FlightCount,
/*15149*/ 	MIN(a.FlightMinutes) AS FlightMinutesMin,
/*15150*/ 	MAX(A.FlightMinutes) AS FlightMinutesMax,
/*15151*/ 	AVG(A.FlightMinutes) AS FlightMinutesAvg,
/*15152*/ 	ISNULL(STDEV(A.FlightMinutes), 0) AS FlightMinutesStDev,
/*15153*/ 	MIN(A.FlightAirtime) AS FlightAirtimeMin,
/*15154*/ 	MAX(A.FlightAirtime) AS FlightAirtimeMax,
/*15155*/ 	AVG(A.FlightAirtime) AS FlightAirtimeAvg,
/*15156*/ 	ISNULL(STDEV(A.FlightAirtime), 0) AS FlightAirtimeStDev
/*15157*/ 	
/*15158*/ FROM
/*15159*/ 	(SELECT 
/*15160*/ 		Flight.FlightId,
/*15161*/ 		Flight.FlownRouteID,
/*15162*/ 		Flight.MeterUnitId,
/*15163*/ 		Flight.ReturnDateTime_Local,
/*15164*/ 		Flight.DepartureDateTime_Local,
/*15165*/ 		DATEDIFF(minute, Flight.DepartureDateTime_Local, Flight.ReturnDateTime_Local) AS FlightMinutes,
/*15166*/ 		(Flight.HobbsEnd - Flight.HobbsStart) AS FlightAirtime
/*15167*/ 	FROM 
/*15168*/ 		dbo.Flight
/*15169*/ 		INNER JOIN dbo.Aircraft ON Aircraft.AircraftId = Flight.AircraftId
/*15170*/ 		INNER JOIN dbo.Program ON Program.ProgId = Aircraft.ProgId
/*15171*/ 	WHERE Program.ProgId = @ProgID AND Flight.FlightDateSort >= @DateBegin AND Flight.FlightDateSort <= @DateEnd) AS A
/*15172*/ 	INNER JOIN dbo.[ROUTE] ON [ROUTE].RouteId = A.FlownRouteId
/*15173*/ 	INNER JOIN dbo.Location ON Location.LocactionId = [Route].LocationId
/*15174*/ GROUP BY 
/*15175*/ 	Location.LocationName,
/*15176*/ 	Location.LocactionId,
/*15177*/ 	[Route].NAME,
/*15178*/ 	A.FlownRouteId,
/*15179*/ 	A.MeterUnitId
/*15180*/ ORDER BY 
/*15181*/ 	Location.LocationName,
/*15182*/ 	[Route].NAME
/*15183*/ 	
/*15184*/ SELECT 
/*15185*/ 	Program.ProgName,
/*15186*/ 	Flight.LocationId,
/*15187*/ 	Location.LocationName,
/*15188*/ 	Flight.SchedRouteId,
/*15189*/ 	SchedRoute.NAME AS SchedRouteName,
/*15190*/ 	Flight.FlownRouteId,
/*15191*/ 	FlownRoute.NAME AS FlownRouteName,
/*15192*/ 	Flight.AircraftId,
/*15193*/ 	Aircraft.MSN,
/*15194*/ 	Flight.FlightId,
/*15195*/ 	Flight.PilotId,
/*15196*/ 	[Pilot].StringValue AS PilotName,
/*15197*/ 	CASE 
/*15198*/ 		WHEN ABS(DATEDIFF(minute, Flight.ReturnDateTime_Local, Flight.DepartureDateTime_Local)) > (#tempStats.FlightMinutesAvg + (@NbrOfStDevs * #tempStats.FlightMinutesStDev)) THEN 1
/*15199*/ 		ELSE 0
/*15200*/ 		END AS FlightTimeOutlier,
/*15201*/ 	CASE 
/*15202*/ 		WHEN ABS(Flight.HobbsEnd - Flight.HobbsStart) > (#tempStats.FlightAirtimeAvg + (CONVERT(DECIMAL(9,1), @NbrOfStDevs) * #tempStats.FlightAirtimeStDev)) THEN 1
/*15203*/ 		ELSE 0
/*15204*/ 		END AS FlightAirtimeOutlier,
/*15205*/ 	#tempStats.FlightCount,
/*15206*/ 	Flight.FlightDateSort,
/*15207*/ 	Flight.DepartureTime,
/*15208*/ 	Flight.ReturnTime,
/*15209*/ 	DATEDIFF(minute, Flight.DepartureDateTime_Local, Flight.ReturnDateTime_Local) AS FlightMinutes,
/*15210*/ 	#tempStats.FlightMinutesAvg,
/*15211*/ 	#tempStats.FlightMinutesStDev,
/*15212*/ 	Flight.HobbsStart,
/*15213*/ 	Flight.HobbsEnd,
/*15214*/ 	Flight.MeterUnitId,
/*15215*/ 	LengthUnit.StringValue AS MeterUnit,
/*15216*/ 	Flight.HobbsEnd - Flight.HobbsStart AS FlightAirtime,
/*15217*/ 	#tempStats.FlightAirtimeAvg,
/*15218*/ 	#TempStats.FlightAirtimeStDev
/*15219*/ FROM
/*15220*/ 	Flight
/*15221*/ 	INNER JOIN Location ON Location.LocactionId = Flight.LocationId
/*15222*/ 	INNER JOIN Aircraft ON Aircraft.AircraftId = Flight.AircraftId
/*15223*/ 	INNER JOIN Program ON Program.ProgId = Location.ProgId
/*15224*/ 	INNER JOIN [Route] AS SchedRoute ON SchedRoute.RouteId = Flight.SchedRouteId
/*15225*/ 	INNER JOIN [Route] AS FlownRoute ON FlownRoute.RouteId = Flight.FlownRouteId
/*15226*/ 	INNER JOIN [Pilot] ON [Pilot].Id = Flight.PilotId
/*15227*/ 	INNER JOIN [LengthUnit] ON LengthUnit.Id = Flight.MeterUnitId
/*15228*/ 	INNER JOIN #tempStats ON #tempStats.LocationId = Flight.LocationId AND #tempStats.RouteId = Flight.FlownRouteId AND #tempStats.MeterUnitId = Flight.MeterUnitId
/*15229*/ WHERE
/*15230*/ 	Flight.FlightDateSort >= @DateBegin AND Flight.FlightDateSort <= @DateEnd
/*15231*/ 	AND Location.ProgId = @ProgId
/*15232*/ 	AND (ABS(DATEDIFF(minute, Flight.ReturnDateTime_Local, Flight.DepartureDateTime_Local)) > (#tempStats.FlightMinutesAvg + (@NbrOfStDevs * #tempStats.FlightMinutesStDev))
/*15233*/ 		 OR ABS(Flight.HobbsEnd - Flight.HobbsStart) > (#tempStats.FlightAirtimeAvg + (CONVERT(DECIMAL(9,1), @NbrOfStDevs) * #tempStats.FlightAirtimeStDev)))
/*15234*/ ORDER BY
/*15235*/ 	Location.LocationName,
/*15236*/ 	SchedRouteName,
/*15237*/ 	FlownRouteName,
/*15238*/ 	Flight.DepartureDateTime_Local
/*15239*/ RETURN 
/*15240*/ GO
/*15241*/ SET ANSI_NULLS ON
/*15242*/ GO
/*15243*/ SET QUOTED_IDENTIFIER ON
/*15244*/ GO
-- ===== updateFlight (database/FLT_Schema.sql:17233-17386) =====
/*17233*/ CREATE PROCEDURE [dbo].[updateFlight]
/*17234*/ 	@FlightId int,
/*17235*/ 	@AircraftId Int,
/*17236*/ 	@LocationId Int,
/*17237*/ 	@SchedRouteId Int,
/*17238*/ 	@FlownRouteId INT,
/*17239*/ 	@FlightDate varchar(10),
/*17240*/ 	@FlightDateSort VARCHAR(10),
/*17241*/ 	@WorkShiftIndicatorId Int,
/*17242*/ 	@AirframeWeightId INT = 0,
/*17243*/ 	@Cargo1WeightId INT = 0,
/*17244*/ 	@Cargo2WeightId INT = 0,
/*17245*/ 	@BallastWeightId INT = 0,
/*17246*/ 	@PilotId INT, 
/*17247*/ 	@PreFlightFtiOK smallint = 0,
/*17248*/ 	@PreFlightTelemetryOK smallint = 0,
/*17249*/ 	@PreFlightTelemetryCheckComplete smallint = 0,
/*17250*/ 	@OilLevelIndicatorStart smallint = 0,
/*17251*/ 	@HydraulicLevelIndicatorStart smallint = 0,
/*17252*/ 	@UsedMeterOffset DECIMAL(9,1) = 0,
/*17253*/ 	@MeterUnitId INT,
/*17254*/ 	@DepartureTime varchar(8),
/*17255*/ 	@DepartureDateTime_Local DATETIME,
/*17256*/ 	@DepartureDateTime_UTC DATETIME,
/*17257*/ 	@AircraftEngineHoursCurrent DECIMAL(11,1) = 0,
/*17258*/ 	@EngineHoursStart DECIMAL(7,1) = 0,
/*17259*/ 	@HobbsStart DECIMAL(9,1),
/*17260*/ 	@AirframeHoursStart DECIMAL(9,1),
/*17261*/ 	@ReturnTime varchar(8),
/*17262*/ 	@ReturnDateTime_Local DATETIME,
/*17263*/ 	@ReturnDateTime_UTC DATETIME,
/*17264*/ 	@HobbsEnd DECIMAL(9,1),
/*17265*/ 	@AirframeHoursEnd DECIMAL(9,1),
/*17266*/ 	@EngineHoursEnd DECIMAL(7,1) = 0,
/*17267*/ 	@PostFlightFtiOK smallint = 0,
/*17268*/ 	@PostFlightTelemetryCheckComplete smallint = 0,
/*17269*/ 	@NacelleCheckBuildup smallint = 0,
/*17270*/ 	@NacelleCheckDiscoloration smallint = 0,
/*17271*/ 	@IsApproved BIT = 0,
/*17272*/ 	@ApprovedBy NVARCHAR(20) = '',
/*17273*/ 	@UTCDateApproved DATETIME = NULL,
/*17274*/ 	@FlightGuid uniqueIdentifier,
/*17275*/ 	@IsActive bit, 
/*17276*/ 	@StampUserName nvarchar(20), 
/*17277*/ 	@ConcurrencyId bigint,
/*17278*/ 	@NewConcurrencyId bigint OUTPUT,
/*17279*/ 	@NewUTCDate datetime OUTPUT
/*17280*/ AS
/*17281*/ BEGIN
/*17282*/ 	SET NOCOUNT ON
/*17283*/ 
/*17284*/ 	DECLARE @IsPreviouslyApproved BIT
/*17285*/ 	
/*17286*/ 	IF @IsApproved = 1
/*17287*/ 	BEGIN
/*17288*/ 	
/*17289*/ 		SELECT @IsPreviouslyApproved = IsApproved
/*17290*/ 		FROM Flight 
/*17291*/ 		WHERE Flight.FlightId = @FlightId
/*17292*/ 
/*17293*/ 		IF @IsPreviouslyApproved = 0
/*17294*/ 		BEGIN
/*17295*/ 			
/*17296*/ 			SELECT 
/*17297*/ 				@ApprovedBy = @StampUserName,
/*17298*/ 				@UTCDateApproved = GETUTCDATE()
/*17299*/ 				
/*17300*/ 		END	
/*17301*/ 	END
/*17302*/ 	
/*17303*/ 	UPDATE [dbo].[Flight]
/*17304*/ 	SET
/*17305*/ 		AircraftId = @AircraftId, 
/*17306*/ 		LocationId = @LocationId, 
/*17307*/ 		SchedRouteId = @SchedRouteId, 
/*17308*/ 		FlownRouteId = @FlownRouteId,
/*17309*/ 		FlightDate = @FlightDate, 
/*17310*/ 		FlightDateSort = @FlightDateSort,
/*17311*/ 		WorkShiftIndicatorId = @WorkShiftIndicatorId, 
/*17312*/ 		AirframeWeightId = @AirframeWeightId,
/*17313*/ 		Cargo1WeightId = @Cargo1WeightId,
/*17314*/ 		Cargo2WeightId = @Cargo2WeightId,
/*17315*/ 		BallastWeightId = @BallastWeightId,
/*17316*/ 		PilotId = @PilotId,
/*17317*/ 		PreFlightFtiOK = @PreFlightFtiOK, 
/*17318*/ 		PreFlightTelemetryOK = @PreFlightTelemetryOK, 
/*17319*/ 		PreFlightTelemetryCheckComplete = @PreFlightTelemetryCheckComplete, 
/*17320*/ 		OilLevelIndicatorStart = @OilLevelIndicatorStart, 
/*17321*/ 		HydraulicLevelIndicatorStart = @HydraulicLevelIndicatorStart, 
/*17322*/ 		UsedMeterOffset = @UsedMeterOffset, 
/*17323*/ 		MeterUnitId = @MeterUnitId,
/*17324*/ 		DepartureTime = @DepartureTime, 
/*17325*/ 		DepartureDateTime_Local = @DepartureDateTime_Local,
/*17326*/ 		DepartureDateTime_UTC = @DepartureDateTime_UTC,
/*17327*/ 		AircraftEngineHoursCurrent = @AircraftEngineHoursCurrent,
/*17328*/ 		EngineHoursStart = @EngineHoursStart, 
/*17329*/ 		HobbsStart = @HobbsStart, 
/*17330*/ 		AirframeHoursStart = @AirframeHoursStart,
/*17331*/ 		ReturnTime = @ReturnTime, 
/*17332*/ 		ReturnDateTime_Local = @ReturnDateTime_Local,
/*17333*/ 		ReturnDateTime_UTC = @ReturnDateTime_UTC,
/*17334*/ 		HobbsEnd = @HobbsEnd, 
/*17335*/ 		AirframeHoursEnd = @AirframeHoursEnd,
/*17336*/ 		EngineHoursEnd = @EngineHoursEnd, 
/*17337*/ 		PostFlightFtiOK = @PostFlightFtiOK, 
/*17338*/ 		PostFlightTelemetryCheckComplete = @PostFlightTelemetryCheckComplete, 
/*17339*/ 		NacelleCheckBuildUp = @NacelleCheckBuildUp, 
/*17340*/ 		NacelleCheckDiscoloration = @NacelleCheckDiscoloration, 
/*17341*/ 		IsApproved = @IsApproved,
/*17342*/ 		ApprovedBy = @ApprovedBy,
/*17343*/ 		UTCDateApproved = @UTCDateApproved,
/*17344*/ 		FlightGuid = @FlightGuid, 
/*17345*/ 		IsActive = @IsActive , 
/*17346*/ 		UTCDateModified = GetUTCDate(), 
/*17347*/ 		StampUserName = @StampUserName 
/*17348*/ 	WHERE
/*17349*/ 		FlightId = @FlightId AND 
/*17350*/ 		ConcurrencyId = @ConcurrencyId
/*17351*/ 
/*17352*/ 	IF @@ROWCOUNT = 0
/*17353*/ 		BEGIN
/*17354*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*17355*/ 		RETURN
/*17356*/ 		END
/*17357*/ 	
/*17358*/ 	SELECT
/*17359*/ 		@NewConcurrencyId = ConcurrencyId,
/*17360*/ 		@NewUTCDate = UTCDateModified
/*17361*/ 	FROM [dbo].[Flight]
/*17362*/ 	WHERE 
/*17363*/ 		FlightId = @FlightId
/*17364*/ 
/*17365*/ 	UPDATE dbo.Aircraft
/*17366*/ 		SET 
/*17367*/ 			Aircraft.StampUserName = @StampUserName,
/*17368*/ 			Aircraft.UTCDateModified = GETUTCDATE(),
/*17369*/ 			Aircraft.AirframeHoursCurrent = 
/*17370*/ 				(SELECT MAX(Flight.AirframeHoursEnd) FROM Flight 
/*17371*/ 				 WHERE Flight.AircraftId = @AircraftId
/*17372*/ 				 AND Flight.IsActive = 1 AND Flight.IsDeleted = 0),
/*17373*/ 			Aircraft.AircraftEngineHoursCurrent = 
/*17374*/ 				(SELECT MAX(Flight.EngineHoursEnd) FROM Flight
/*17375*/ 				 WHERE Flight.AircraftId = @AircraftId 
/*17376*/ 				 AND Flight.IsActive = 1 AND Flight.IsDeleted = 0)
/*17377*/ 	WHERE dbo.Aircraft.AircraftId = @AircraftId
/*17378*/ 
/*17379*/ END
/*17380*/ 
/*17381*/ GO
/*17382*/ SET ANSI_NULLS ON
/*17383*/ GO
/*17384*/ SET QUOTED_IDENTIFIER ON
/*17385*/ GO
/*17386*/ 
-- ===== updateFlightComment (database/FLT_Schema.sql:17387-17443) =====
/*17387*/ CREATE PROCEDURE [dbo].[updateFlightComment]
/*17388*/ 	@FlightCommentId int,
/*17389*/ 	@FlightId Int,
/*17390*/ 	@ComponentId Int = 0,
/*17391*/ 	@CommentTime VARCHAR(8),
/*17392*/ 	@CommentDateTime_UTC DATETIME,
/*17393*/ 	@CommentDateTime_Local DATETIME,
/*17394*/ 	@IssueCodeId INT,
/*17395*/ 	@PilotComment nvarchar(2048),
/*17396*/ 	@CommentRating SMALLINT,
/*17397*/ 	@IsActive bit, 
/*17398*/ 	@StampUserName nvarchar(20), 
/*17399*/ 	@ConcurrencyId bigint,
/*17400*/ 	@NewConcurrencyId bigint OUTPUT,
/*17401*/ 	@NewUTCDate datetime OUTPUT
/*17402*/ AS
/*17403*/ BEGIN
/*17404*/ 	SET NOCOUNT ON
/*17405*/ 
/*17406*/ 	UPDATE [dbo].[FlightComment]
/*17407*/ 	SET
/*17408*/ 		FlightId = @FlightId, 
/*17409*/ 		ComponentId = @ComponentId, 
/*17410*/ 		CommentTime = @CommentTime, 
/*17411*/ 		CommentDateTime_UTC = @CommentDateTime_UTC,
/*17412*/ 		CommentDateTime_Local = @CommentDateTime_Local,
/*17413*/ 		IssueCodeId = @IssueCodeId,
/*17414*/ 		PilotComment = @PilotComment, 
/*17415*/ 		CommentRating = @CommentRating,
/*17416*/ 		IsActive = @IsActive , 
/*17417*/ 		UTCDateModified = GetUTCDate()
/*17418*/ , 
/*17419*/ 		StampUserName = @StampUserName 
/*17420*/ 	WHERE
/*17421*/ 		FlightCommentId = @FlightCommentId AND 
/*17422*/ 		ConcurrencyId = @ConcurrencyId
/*17423*/ 
/*17424*/ 	IF @@ROWCOUNT = 0
/*17425*/ 		BEGIN
/*17426*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*17427*/ 		RETURN
/*17428*/ 		END
/*17429*/ 	
/*17430*/ 	SELECT
/*17431*/ 		@NewConcurrencyId = ConcurrencyId,
/*17432*/ 		@NewUTCDate = UTCDateModified
/*17433*/ 	FROM [dbo].[FlightComment]
/*17434*/ 	WHERE 
/*17435*/ 		FlightCommentId = @FlightCommentId
/*17436*/ 
/*17437*/ END
/*17438*/ GO
/*17439*/ SET ANSI_NULLS ON
/*17440*/ GO
/*17441*/ SET QUOTED_IDENTIFIER ON
/*17442*/ GO
/*17443*/ 
-- ===== updateFlightEngineRun (database/FLT_Schema.sql:17444-17497) =====
/*17444*/ CREATE PROCEDURE [dbo].[updateFlightEngineRun]
/*17445*/ 	@FlightEngineRunId int,
/*17446*/ 	@FlightId Int,
/*17447*/ 	@RunStartTime VARCHAR(8),
/*17448*/ 	@RunEndTime VARCHAR(8),
/*17449*/ 	@EngineSpeed INT,
/*17450*/ 	@RunStartDateTime_Local DATETIME,
/*17451*/ 	@RunStartDateTime_UTC DATETIME,
/*17452*/ 	@RunEndDateTime_Local DATETIME,
/*17453*/ 	@RunEndDateTime_UTC DATETIME,
/*17454*/ 	@StampUserName nvarchar(20), 
/*17455*/ 	@ConcurrencyId timestamp,
/*17456*/ 	@NewConcurrencyId timestamp OUTPUT,
/*17457*/ 	@NewUTCDate datetime OUTPUT
/*17458*/ AS
/*17459*/ BEGIN
/*17460*/ 	SET NOCOUNT ON
/*17461*/ 
/*17462*/ 	UPDATE [dbo].[FlightEngineRun]
/*17463*/ 	SET
/*17464*/ 		FlightId = @FlightId, 
/*17465*/ 		RunStartTime = @RunStartTime,
/*17466*/ 		RunEndTime = @RunEndTime, 
/*17467*/ 		EngineSpeed = @EngineSpeed,
/*17468*/ 		RunStartDateTime_Local = @RunStartDateTime_Local,
/*17469*/ 		RunStartDateTime_UTC = @RunStartDateTime_UTC,
/*17470*/ 		RunEndDateTime_Local = @RunEndDateTime_Local,
/*17471*/ 		RunEndDateTime_UTC = @RunEndDateTime_UTC,
/*17472*/ 		UTCDateModified = GetUTCDate(), 
/*17473*/ 		StampUserName = @StampUserName 
/*17474*/ 	WHERE
/*17475*/ 		FlightEngineRunId = @FlightEngineRunId AND 
/*17476*/ 		ConcurrencyId = @ConcurrencyId
/*17477*/ 
/*17478*/ 	IF @@ROWCOUNT = 0
/*17479*/ 		BEGIN
/*17480*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*17481*/ 		RETURN
/*17482*/ 		END
/*17483*/ 	
/*17484*/ 	SELECT
/*17485*/ 		@NewConcurrencyId = ConcurrencyId,
/*17486*/ 		@NewUTCDate = UTCDateModified
/*17487*/ 	FROM [dbo].[FlightEngineRun]
/*17488*/ 	WHERE 
/*17489*/ 		FlightEngineRunId = @FlightEngineRunId
/*17490*/ 
/*17491*/ END
/*17492*/ GO
/*17493*/ SET ANSI_NULLS ON
/*17494*/ GO
/*17495*/ SET QUOTED_IDENTIFIER ON
/*17496*/ GO
/*17497*/ 
-- ===== updateFlightRegionTime (database/FLT_Schema.sql:17498-17544) =====
/*17498*/ CREATE PROCEDURE [dbo].[updateFlightRegionTime]
/*17499*/ 	@FlightRegionTimeId int,
/*17500*/ 	@FlightId Int,
/*17501*/ 	@RegionId Int,
/*17502*/ 	@Hours DECIMAL(7,1),
/*17503*/ 	@IsActive bit, 
/*17504*/ 	@StampUserName nvarchar(20), 
/*17505*/ 	@ConcurrencyId timestamp,
/*17506*/ 	@NewConcurrencyId timestamp OUTPUT,
/*17507*/ 	@NewUTCDate datetime OUTPUT
/*17508*/ AS
/*17509*/ BEGIN
/*17510*/ 	SET NOCOUNT ON
/*17511*/ 
/*17512*/ 	UPDATE [dbo].[FlightRegionTime]
/*17513*/ 	SET
/*17514*/ 		FlightId = @FlightId, 
/*17515*/ 		RegionId = @RegionId, 
/*17516*/ 		Hours = @Hours, 
/*17517*/ 		IsActive = @IsActive , 
/*17518*/ 		UTCDateModified = GetUTCDate()
/*17519*/ , 
/*17520*/ 		StampUserName = @StampUserName 
/*17521*/ 	WHERE
/*17522*/ 		FlightRegionTimeId = @FlightRegionTimeId AND 
/*17523*/ 		ConcurrencyId = @ConcurrencyId
/*17524*/ 
/*17525*/ 	IF @@ROWCOUNT = 0
/*17526*/ 		BEGIN
/*17527*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*17528*/ 		RETURN
/*17529*/ 		END
/*17530*/ 	
/*17531*/ 	SELECT
/*17532*/ 		@NewConcurrencyId = ConcurrencyId,
/*17533*/ 		@NewUTCDate = UTCDateModified
/*17534*/ 	FROM [dbo].[FlightRegionTime]
/*17535*/ 	WHERE 
/*17536*/ 		FlightRegionTimeId = @FlightRegionTimeId
/*17537*/ 
/*17538*/ END
/*17539*/ GO
/*17540*/ SET ANSI_NULLS ON
/*17541*/ GO
/*17542*/ SET QUOTED_IDENTIFIER ON
/*17543*/ GO
/*17544*/ 
