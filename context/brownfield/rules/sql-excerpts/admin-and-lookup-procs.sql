-- Excerpt of live stored procedures from database/FLT_Schema.sql (called from code, with branching logic).
-- Each line is prefixed with its ORIGINAL line number in database/FLT_Schema.sql.
-- Cite rules as database/FLT_Schema.sql:<that number>, never this excerpt file.

-- ===== fltValidateLogin (database/FLT_Schema.sql:6731-6828) =====
/*6731*/ CREATE PROCEDURE [dbo].[fltValidateLogin] 
/*6732*/ @UserName AS NVARCHAR(20),
/*6733*/ @Password AS NVARCHAR(128)
/*6734*/ AS
/*6735*/ BEGIN
/*6736*/ 	SET NOCOUNT ON;
/*6737*/ 	
/*6738*/ 	DECLARE @UTCDate AS DATETIME
/*6739*/ 	SELECT @UTCDate = GETUTCDATE()
/*6740*/ 	
/*6741*/ 	DECLARE @UserCount AS INT
/*6742*/ 	
/*6743*/ 	SELECT @UserCount = COUNT(*)
/*6744*/ 	FROM fltUser
/*6745*/ 	WHERE	
/*6746*/ 		LOWER(@username) = LOWER(UserName) AND 
/*6747*/ 		LOWER(@Password) = LOWER(Password) AND
/*6748*/ 		FltUser.IsApproved = 1 AND
/*6749*/ 		FltUser.IsActive = 1 AND
/*6750*/ 		fltUser.IsDeleted = 0 AND
/*6751*/ 		fltUser.IsLockedOut = 0
/*6752*/ 	
/*6753*/ 	IF @UserCount = 1 
/*6754*/ 	BEGIN
/*6755*/ 		
/*6756*/ 		SELECT
/*6757*/ 			u.DisplayName,
/*6758*/ 			ISNULL(p.ProgName,'') AS DefaultProgName,
/*6759*/ 			ISNULL(u.utcLastLoginDate,'') AS LastLoginDate,
/*6760*/ 			u.UserName,
/*6761*/ 			u.DefaultProgId,
/*6762*/ 			u.IsSuperUser
/*6763*/ 		FROM
/*6764*/ 			FltUser AS u 
/*6765*/ 			LEFT OUTER JOIN Program AS p ON u.DefaultProgId = p.ProgId
/*6766*/ 		WHERE
/*6767*/ 			u.UserName = @UserName
/*6768*/ 		
/*6769*/ 		UPDATE fltUser
/*6770*/ 		SET utcLastLoginDate = @UTCDate
/*6771*/ 		WHERE UserName = @UserName 
/*6772*/ 		
/*6773*/ 		DECLARE @IsSuperUser AS BIT
/*6774*/ 		SELECT @IsSuperUser = 0
/*6775*/ 		
/*6776*/ 		SELECT @IsSuperUser = IsSuperUser
/*6777*/ 		FROM fltUser 
/*6778*/ 		WHERE UserName = @UserName
/*6779*/ 		
/*6780*/ 		IF @IsSuperUser = 1
/*6781*/ 		BEGIN
/*6782*/ 			
/*6783*/ 			SELECT
/*6784*/ 				ProgId,
/*6785*/ 				ProgName
/*6786*/ 			FROM
/*6787*/ 				Program
/*6788*/ 			WHERE
/*6789*/ 				IsActive = 1 AND isDeleted = 0
/*6790*/ 			ORDER BY
/*6791*/ 				ProgId
/*6792*/ 				
/*6793*/ 		END
/*6794*/ 		ELSE
/*6795*/ 		BEGIN
/*6796*/ 			
/*6797*/ 			SELECT
/*6798*/ 				p.ProgId,
/*6799*/ 				p.ProgName
/*6800*/ 			FROM
/*6801*/ 				FltUser AS u, 
/*6802*/ 				FltUserInRole AS uir, 
/*6803*/ 				FltRole AS r,
/*6804*/ 				Program AS p
/*6805*/ 			WHERE
/*6806*/ 				u.UserName = uir.UserName AND
/*6807*/ 				uir.IsDeleted = 0 AND
/*6808*/ 				uir.RoleId = r.RoleId AND
/*6809*/ 				r.IsActive = 1 AND
/*6810*/ 				r.IsDeleted = 0 AND
/*6811*/ 				r.ProgId = p.ProgID AND
/*6812*/ 				p.IsActive = 1 AND
/*6813*/ 				p.IsDeleted = 0 AND
/*6814*/ 				u.UserName = @UserName
/*6815*/ 			ORDER BY
/*6816*/ 				p.ProgID
/*6817*/ 			
/*6818*/ 		END
/*6819*/ 		
/*6820*/ 	END
/*6821*/ 			
/*6822*/ END
/*6823*/ GO
/*6824*/ SET ANSI_NULLS ON
/*6825*/ GO
/*6826*/ SET QUOTED_IDENTIFIER ON
/*6827*/ GO
/*6828*/ 
-- ===== listAircraftInfos (database/FLT_Schema.sql:12860-12976) =====
/*12860*/ CREATE PROCEDURE [dbo].[listAircraftInfos]
/*12861*/ @ProgId INT=0, @CurrentLocationId INT=0, @AircraftTextMatch NVARCHAR (30)='', @IsActiveFilter INT=-1, @IsDeletedFilter INT=0, @Start INT=-1, @Count INT=-1, @Total INT OUTPUT
/*12862*/ AS
/*12863*/ BEGIN
/*12864*/     SET NOCOUNT ON;
/*12865*/     CREATE TABLE #temp (
/*12866*/         tempID      INT IDENTITY PRIMARY KEY,
/*12867*/         [AircraftId] INT
/*12868*/     );
/*12869*/     INSERT INTO #temp ([AircraftId])
/*12870*/     SELECT   [AircraftId]
/*12871*/     FROM     [dbo].[Aircraft]
/*12872*/     WHERE    ((@IsActiveFilter = 1
/*12873*/                AND [Aircraft].[IsActive] = 1)
/*12874*/               OR (@IsActiveFilter = 0
/*12875*/                   AND [Aircraft].[IsActive] = 0)
/*12876*/               OR (@IsActiveFilter = -1))
/*12877*/              AND ((@IsDeletedFilter = 1
/*12878*/                    AND [Aircraft].[IsDeleted] = 1)
/*12879*/                   OR (@IsDeletedFilter = 0
/*12880*/                       AND [Aircraft].[IsDeleted] = 0)
/*12881*/                   OR (@IsDeletedFilter = -1))
/*12882*/              AND ((@ProgId = 0)
/*12883*/                   OR ([dbo].[Aircraft].[ProgId] = @ProgId))
/*12884*/              AND ((@CurrentLocationId = 0)
/*12885*/                   OR (isnull([dbo].[Aircraft].[CurrentLocationId], 0) = @CurrentLocationId))
/*12886*/              AND ((@AircraftTextMatch = '')
/*12887*/                   OR ([dbo].[Aircraft].[SerialNbr] LIKE @AircraftTextMatch)
/*12888*/                   OR ([dbo].[Aircraft].[RegistrationNbr] LIKE @AircraftTextMatch)
/*12889*/                   OR ([dbo].[Aircraft].[MSN] LIKE @AircraftTextMatch)
/*12890*/                   OR ([dbo].[Aircraft].[ShipNbr] LIKE @AircraftTextMatch))
/*12891*/     ORDER BY [Aircraft].[MSN];
/*12892*/     DECLARE @FromID AS INT;
/*12893*/     DECLARE @ToID AS INT;
/*12894*/     IF ((@Start = -1)
/*12895*/         OR (@Count = -1))
/*12896*/         BEGIN
/*12897*/             SELECT @FromID = 0;
/*12898*/             SELECT @ToID = 999999;
/*12899*/         END
/*12900*/     ELSE
/*12901*/         BEGIN
/*12902*/             SELECT @FromID = @Start;
/*12903*/             SELECT @ToID = @Start + @Count - 1;
/*12904*/         END
/*12905*/     CREATE TABLE #tempFlightUsage (
/*12906*/         #tempFlightUsageId INT            IDENTITY PRIMARY KEY,
/*12907*/         AircraftId          INT           ,
/*12908*/         CurrentUsage     DECIMAL (8, 1)
/*12909*/     );
/*12910*/     INSERT INTO #tempFlightUsage (AircraftId, CurrentUsage)
/*12911*/     SELECT   AircraftId,
/*12912*/              SUM(FlightUsage)
/*12913*/     FROM     (SELECT Flight.AircraftId,
/*12914*/                      (HobbsEnd - HobbsStart) AS FlightUsage
/*12915*/               FROM   dbo.Flight
/*12916*/                      INNER JOIN
/*12917*/                      #temp
/*12918*/                      ON #temp.AircraftId = dbo.Flight.AircraftId
/*12919*/               WHERE  dbo.flight.IsActive = 1
/*12920*/                      AND dbo.flight.IsDeleted = 0) AS T
/*12921*/     GROUP BY T.AircraftId;
/*12922*/     SELECT   [dbo].Aircraft.AircraftId,
/*12923*/              IsNull([dbo].Location.LocationName, 'Not Assigned') AS CurrentLocationName,
/*12924*/              [dbo].Model.StringValue AS ModelName,
/*12925*/              [dbo].Aircraft.MSN,
/*12926*/              [dbo].Aircraft.ShipNbr,
/*12927*/              [dbo].Aircraft.SerialNbr,
/*12928*/              [dbo].Aircraft.RegistrationNbr,
/*12929*/              [dbo].Aircraft.Description,
/*12930*/              [dbo].Aircraft.CurrentLocationId,
/*12931*/              [dbo].Aircraft.LiveryColor,
/*12932*/              [dbo].aircraft.AirframeHoursStart,
/*12933*/              [dbo].Aircraft.AirframeHoursCurrent,
/*12934*/              [dbo].Aircraft.AirframeHoursOffset,
/*12935*/              [dbo].Aircraft.MeterUnitId,
/*12936*/              dbo.Aircraft.TotalRequiredUsage,
/*12937*/              ISNULL([#tempFlightUsage].CurrentUsage, 0) AS CurrentUsage,
/*12938*/              [dbo].Aircraft.EstEndOfTesting,
/*12939*/              [dbo].Aircraft.ActEndOfTesting,
/*12940*/              [dbo].AircraftStatusDef.StringValue AS AircraftStatus,
/*12941*/              [dbo].Aircraft.AircraftEngineHoursCurrent,
/*12942*/              [dbo].Aircraft.IsActive,
/*12943*/              [dbo].Aircraft.IsDeleted,
/*12944*/              [dbo].Aircraft.UTCDateCreated,
/*12945*/              [dbo].Aircraft.UTCDateModified
/*12946*/     FROM     [dbo].[Aircraft]
/*12947*/              LEFT OUTER JOIN
/*12948*/              dbo.Location
/*12949*/              ON Location.LocactionId = Aircraft.CurrentLocationId
/*12950*/              INNER JOIN
/*12951*/              dbo.Model
/*12952*/              ON Model.ID = Aircraft.ModelId
/*12953*/              INNER JOIN
/*12954*/              dbo.AircraftStatusDef
/*12955*/              ON dbo.AircraftStatusDef.Id = Aircraft.AircraftStatusId
/*12956*/              INNER JOIN
/*12957*/              #temp
/*12958*/              ON [dbo].[Aircraft].[AircraftId] = #temp.[AircraftId]
/*12959*/              LEFT OUTER JOIN
/*12960*/              #tempFlightUsage
/*12961*/              ON #tempFlightUsage.AircraftId = dbo.Aircraft.AircraftId
/*12962*/     WHERE    #temp.tempID >= @FromID
/*12963*/              AND #temp.tempID <= @ToID
/*12964*/     ORDER BY dbo.Aircraft.MSN;
/*12965*/     SELECT @Total = COUNT(*)
/*12966*/     FROM   #temp;
/*12967*/     DROP TABLE #temp;
/*12968*/     DROP TABLE #tempFlightUsage;
/*12969*/ END
/*12970*/ 
/*12971*/ GO
/*12972*/ SET ANSI_NULLS ON
/*12973*/ GO
/*12974*/ SET QUOTED_IDENTIFIER ON
/*12975*/ GO
/*12976*/ 
-- ===== listAircraftLocations (database/FLT_Schema.sql:13081-13218) =====
/*13081*/ CREATE PROCEDURE [dbo].[listAircraftLocations]
/*13082*/ 	@AircraftId Int = 0,
/*13083*/ 	@LocationId Int = 0,
/*13084*/ 	@IsActiveFilter int = 1, 
/*13085*/ 	@IsDeletedFilter int = 0, 
/*13086*/ 	@Start int = -1,
/*13087*/ 	@Count int = -1,
/*13088*/ 	@Total int OUTPUT
/*13089*/ AS
/*13090*/ BEGIN
/*13091*/ 	SET NOCOUNT ON
/*13092*/ 
/*13093*/ 	CREATE TABLE #temp (
/*13094*/ 		tempID INT IDENTITY PRIMARY KEY,
/*13095*/ 		[AircraftLocationId] [Int],
/*13096*/ 		[AircraftId]  [Int],
/*13097*/ 		[LocationId]  [Int],
/*13098*/ 		[ArrivalDate]  [Datetime],
/*13099*/ 		[ActEndOfTest]  [DateTime]
/*13100*/ 	)
/*13101*/ 
/*13102*/ 	INSERT INTO #temp (
/*13103*/ 		[AircraftLocationId],
/*13104*/         [AircraftId],
/*13105*/         [LocationId],
/*13106*/ 		[ArrivalDate],
/*13107*/ 		[ActEndOfTest]
/*13108*/ 	)
/*13109*/ 	SELECT
/*13110*/ 		[AircraftLocationId],
/*13111*/         [AircraftId],
/*13112*/         [LocationId],
/*13113*/ 		IsNull([ArrivalDate], Convert(DateTime, '1-Jan-1900')) As ArrivalDate,
/*13114*/ 		IsNull([ActEndOfTest], Convert(Datetime, '12-Dec-2099')) AS ActEndOfTest
/*13115*/ 	FROM [dbo].[AircraftLocation]
/*13116*/ 	WHERE
/*13117*/ 		((@IsActiveFilter = 1 AND [AircraftLocation].[IsActive] = 1) OR (@IsActiveFilter = 0 AND [AircraftLocation].[IsActive] = 0) OR (@IsActiveFilter = -1)) AND 
/*13118*/ 		((@IsDeletedFilter = 1 AND [AircraftLocation].[IsDeleted] = 1) OR (@IsDeletedFilter = 0 AND [AircraftLocation].[IsDeleted] = 0) OR (@IsDeletedFilter = -1)) AND 
/*13119*/ 		((@AircraftId = 0) OR ([dbo].[AircraftLocation].[AircraftId] = @AircraftId)) AND 
/*13120*/ 		((@LocationId = 0) OR ([dbo].[AircraftLocation].[LocationId] = @LocationId))
/*13121*/ 	ORDER BY AircraftLocation.ArrivalDate DESC
/*13122*/ 
/*13123*/ 	SELECT @Total = COUNT(*) FROM #temp
/*13124*/ 
/*13125*/ 	DECLARE @FromID INT
/*13126*/ 	DECLARE @ToID INT
/*13127*/ 
/*13128*/ 	IF ((@Start = -1) OR (@Count = -1))
/*13129*/ 		BEGIN
/*13130*/ 		SELECT @FromID  = 0
/*13131*/ 		SELECT @ToID    = 999999
/*13132*/ 		END
/*13133*/ 	ELSE
/*13134*/ 		BEGIN
/*13135*/ 		SELECT @FromID  = @Start
/*13136*/ 		SELECT @ToID    = @Start + @Count - 1
/*13137*/ 		END
/*13138*/ 	
/*13139*/ 	Delete #temp
/*13140*/ 	Where tempId < @FromId Or tempId > @ToId
/*13141*/ 
/*13142*/ 	CREATE TABLE #tempFlightUsage (
/*13143*/ 		#tempFlightUsageId INT IDENTITY PRIMARY KEY,
/*13144*/ 		AircraftId INT,
/*13145*/ 		LocationId INT,
/*13146*/ 		CurrentUsage DECIMAL(12,1)
/*13147*/ 	)
/*13148*/ 	
/*13149*/ 	INSERT INTO #tempFlightUsage (
/*13150*/ 		AircraftId,
/*13151*/ 		LocationId,
/*13152*/ 		CurrentUsage
/*13153*/ 		)
/*13154*/ 	SELECT
/*13155*/ 		T.AircraftId,
/*13156*/ 		T.LocationId,
/*13157*/ 		SUM(T.FlightUsage)
/*13158*/ 	FROM
/*13159*/ 		(SELECT
/*13160*/ 			Flight.AircraftId,
/*13161*/ 			Flight.LocationId,
/*13162*/ 			FlightUsage = (Flight.HobbsEnd - Flight.HobbsStart)
/*13163*/ 		FROM
/*13164*/ 			dbo.Flight
/*13165*/ 			INNER JOIN #temp ON #temp.AircraftId = Flight.AircraftId AND #temp.LocationId = Flight.LocationId
/*13166*/ 		WHERE
/*13167*/ 			dbo.flight.DepartureDateTime_Local >= #temp.ArrivalDate AND
/*13168*/ 			dbo.flight.DepartureDateTime_Local <= #temp.ActEndOfTest AND
/*13169*/ 			dbo.flight.IsActive = 1 AND
/*13170*/ 			dbo.flight.IsDeleted = 0) AS T
/*13171*/ 	GROUP BY 
/*13172*/ 		T.AircraftId,
/*13173*/ 		T.LocationId
/*13174*/ 	DECLARE @LocationCount INT
/*13175*/ 
/*13176*/ 	SELECT 
/*13177*/ 		[dbo].[AircraftLocation].AircraftLocationid,
/*13178*/ 		[dbo].aircraftLocation.AircraftId,
/*13179*/ 		dbo.AircraftLocation.LocationId,
/*13180*/ 		dbo.AircraftLocation.ArrivalDate,
/*13181*/ 		dbo.AircraftLocation.RequiredUsage,
/*13182*/ 		CONVERT(DECIMAL(9,1),ISNULL(#tempFlightUsage.CurrentUsage,0)) AS AccumUsage,
/*13183*/ 		dbo.AircraftLocation.EstEndOfTest,
/*13184*/ 		dbo.AircraftLocation.ActEndOfTest,
/*13185*/ 		dbo.AircraftLocation.LastLocation,
/*13186*/ 		dbo.AircraftLocation.AircraftLocationGUID,
/*13187*/ 		dbo.AircraftLocation.IsActive,
/*13188*/ 		dbo.AircraftLocation.IsDeleted,
/*13189*/ 		dbo.AircraftLocation.UTCDateCreated,
/*13190*/ 		dbo.AircraftLocation.UTCDateModified,
/*13191*/ 		dbo.AircraftLocation.StampUserName,
/*13192*/ 		dbo.AircraftLocation.ConcurrencyId,
/*13193*/ 		[dbo].Aircraft.SerialNbr,
/*13194*/ 		[dbo].Aircraft.RegistrationNbr,
/*13195*/ 		[dbo].Aircraft.MSN,
/*13196*/ 		[dbo].Aircraft.ShipNbr,
/*13197*/ 		[dbo].Location.LocationName
/*13198*/ 	FROM [dbo].[AircraftLocation]
/*13199*/ 		INNER JOIN [dbo].[Aircraft] ON
/*13200*/ 			[dbo].[Aircraft].[AircraftId] = [dbo].[AircraftLocation].[AircraftId]
/*13201*/ 		INNER JOIN [dbo].[Location] ON
/*13202*/ 			[dbo].[Location].[LocactionId] = [dbo].[AircraftLocation].[LocationId]
/*13203*/ 		INNER JOIN #temp ON 
/*13204*/ 			[dbo].[AircraftLocation].[AircraftLocationId] = #temp.[AircraftLocationId] 
/*13205*/ 		LEFT OUTER JOIN #tempFlightUsage ON 
/*13206*/ 			dbo.aircraftLocation.aircraftId = #tempFlightUsage.AircraftId AND dbo.AircraftLocation.LocationId = #tempFlightUsage.LocationId
/*13207*/ 	ORDER BY 
/*13208*/ 		#temp.tempID
/*13209*/ 
/*13210*/ 	DROP TABLE #temp
/*13211*/ 
/*13212*/ END
/*13213*/ GO
/*13214*/ SET ANSI_NULLS ON
/*13215*/ GO
/*13216*/ SET QUOTED_IDENTIFIER ON
/*13217*/ GO
/*13218*/ 
-- ===== listAircraftStatuses (database/FLT_Schema.sql:13351-13403) =====
/*13351*/ CREATE PROCEDURE [dbo].[listAircraftStatuses]
/*13352*/ 	@ProgId Int = 0,
/*13353*/ 	@SortBy varchar(32)
/*13354*/ AS
/*13355*/ BEGIN
/*13356*/ 	SET NOCOUNT ON;
/*13357*/ 
/*13358*/ 	SELECT 
/*13359*/ 		v.AircraftId,
/*13360*/ 		IsNull(vs.AircraftStatusId, 0) as AircraftStatusId,
/*13361*/ 		IsNull(loc.LocationName, '') as LocationName, 
/*13362*/ 		v.MSN, 
/*13363*/ 		IsNull(vs.Status, '') as [Status], 
/*13364*/ 		IsNull(vs.EngineerComment, '') as EngineerComment, 
/*13365*/ 		IsNull(vs.HangarComment, '') as HangarComment, 
/*13366*/ 		vs.UTCDateModified 
/*13367*/ 	INTO
/*13368*/ 		#temp
/*13369*/ 	FROM 
/*13370*/ 		Aircraft v
/*13371*/ 		left outer join AircraftStatus vs 
/*13372*/ 			ON v.AircraftId = vs.AircraftId
/*13373*/ 		left outer join Location loc
/*13374*/ 			ON v.CurrentLocationId = loc.LocactionId
/*13375*/ 	WHERE 
/*13376*/ 		v.IsDeleted = 0 AND 
/*13377*/ 		((@ProgId = 0) OR (v.ProgId = @ProgId))
/*13378*/ 
/*13379*/ 	if @SortBy = 'Location' 
/*13380*/ 	begin
/*13381*/ 		SELECT * FROM #temp
/*13382*/ 		ORDER BY LocationName DESC, MSN
/*13383*/ 	end 
/*13384*/ 
/*13385*/ 	if @SortBy = 'MSN' 
/*13386*/ 	begin
/*13387*/ 		SELECT * FROM #temp
/*13388*/ 		ORDER BY MSN
/*13389*/ 	end 
/*13390*/ 
/*13391*/ 	if @SortBy = 'Date' 
/*13392*/ 	begin
/*13393*/ 		SELECT * FROM #temp
/*13394*/ 		ORDER BY UTCDateModified DESC, MSN
/*13395*/ 	end 
/*13396*/ 	
/*13397*/ END
/*13398*/ GO
/*13399*/ SET ANSI_NULLS ON
/*13400*/ GO
/*13401*/ SET QUOTED_IDENTIFIER ON
/*13402*/ GO
/*13403*/ 
-- ===== updateFltModule (database/FLT_Schema.sql:15757-15799) =====
/*15757*/ CREATE PROCEDURE [dbo].[updateFltModule]
/*15758*/ 	@ModuleName nvarchar(50),
/*15759*/ 	@ModuleDescription nvarchar(255) = '',
/*15760*/ 	@IsActive bit, 
/*15761*/ 	@StampUserName nvarchar(20), 
/*15762*/ 	@ConcurrencyId bigint,
/*15763*/ 	@NewConcurrencyId bigint OUTPUT,
/*15764*/ 	@NewUTCDate datetime OUTPUT
/*15765*/ AS
/*15766*/ BEGIN
/*15767*/ 	SET NOCOUNT ON
/*15768*/ 
/*15769*/ 	UPDATE [dbo].[FltModule]
/*15770*/ 	SET
/*15771*/ 		ModuleDescription = @ModuleDescription, 
/*15772*/ 		IsActive = @IsActive , 
/*15773*/ 		UTCDateModified = GetUTCDate()
/*15774*/ , 
/*15775*/ 		StampUserName = @StampUserName 
/*15776*/ 	WHERE
/*15777*/ 		ModuleName = @ModuleName AND 
/*15778*/ 		ConcurrencyId = @ConcurrencyId
/*15779*/ 
/*15780*/ 	IF @@ROWCOUNT = 0
/*15781*/ 		BEGIN
/*15782*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*15783*/ 		RETURN
/*15784*/ 		END
/*15785*/ 	
/*15786*/ 	SELECT
/*15787*/ 		@NewConcurrencyId = ConcurrencyId,
/*15788*/ 		@NewUTCDate = UTCDateModified
/*15789*/ 	FROM [dbo].[FltModule]
/*15790*/ 	WHERE 
/*15791*/ 		ModuleName = @ModuleName
/*15792*/ 
/*15793*/ END
/*15794*/ GO
/*15795*/ SET ANSI_NULLS ON
/*15796*/ GO
/*15797*/ SET QUOTED_IDENTIFIER ON
/*15798*/ GO
/*15799*/ 
-- ===== updateFltRole (database/FLT_Schema.sql:15800-15848) =====
/*15800*/ CREATE PROCEDURE [dbo].[updateFltRole]
/*15801*/ 	@ProgId Int,
/*15802*/ 	@RoleId int,
/*15803*/ 	@RoleName nvarchar(50),
/*15804*/ 	@RoleDescription nvarchar(255) = '',
/*15805*/ 	@IsProgramManager bit = 0,
/*15806*/ 	@IsActive bit, 
/*15807*/ 	@StampUserName nvarchar(20), 
/*15808*/ 	@ConcurrencyId bigint,
/*15809*/ 	@NewConcurrencyId bigint OUTPUT,
/*15810*/ 	@NewUTCDate datetime OUTPUT
/*15811*/ AS
/*15812*/ BEGIN
/*15813*/ 	SET NOCOUNT ON
/*15814*/ 
/*15815*/ 	UPDATE [dbo].[FltRole]
/*15816*/ 	SET
/*15817*/ 		ProgId = @ProgId, 
/*15818*/ 		RoleName = @RoleName, 
/*15819*/ 		RoleDescription = @RoleDescription, 
/*15820*/ 		IsProgramManager = @IsProgramManager, 
/*15821*/ 		IsActive = @IsActive , 
/*15822*/ 		UTCDateModified = GetUTCDate()
/*15823*/ , 
/*15824*/ 		StampUserName = @StampUserName 
/*15825*/ 	WHERE
/*15826*/ 		RoleId = @RoleId AND 
/*15827*/ 		ConcurrencyId = @ConcurrencyId
/*15828*/ 
/*15829*/ 	IF @@ROWCOUNT = 0
/*15830*/ 		BEGIN
/*15831*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*15832*/ 		RETURN
/*15833*/ 		END
/*15834*/ 	
/*15835*/ 	SELECT
/*15836*/ 		@NewConcurrencyId = ConcurrencyId,
/*15837*/ 		@NewUTCDate = UTCDateModified
/*15838*/ 	FROM [dbo].[FltRole]
/*15839*/ 	WHERE 
/*15840*/ 		RoleId = @RoleId
/*15841*/ 
/*15842*/ END
/*15843*/ GO
/*15844*/ SET ANSI_NULLS ON
/*15845*/ GO
/*15846*/ SET QUOTED_IDENTIFIER ON
/*15847*/ GO
/*15848*/ 
-- ===== updateFltRoleModulePermissions (database/FLT_Schema.sql:15849-15896) =====
/*15849*/ CREATE PROCEDURE [dbo].[updateFltRoleModulePermissions]
/*15850*/ 	@RoleId Int,
/*15851*/ 	@ModuleName nvarchar(50),
/*15852*/ 	@CanView bit = 0,
/*15853*/ 	@CanEdit bit = 0,
/*15854*/ 	@IsActive bit, 
/*15855*/ 	@StampUserName nvarchar(20), 
/*15856*/ 	@ConcurrencyId bigint,
/*15857*/ 	@NewConcurrencyId bigint OUTPUT,
/*15858*/ 	@NewUTCDate datetime OUTPUT
/*15859*/ AS
/*15860*/ BEGIN
/*15861*/ 	SET NOCOUNT ON
/*15862*/ 
/*15863*/ 	UPDATE [dbo].[FltRoleModulePermissions]
/*15864*/ 	SET
/*15865*/ 		CanView = @CanView, 
/*15866*/ 		CanEdit = @CanEdit, 
/*15867*/ 		IsActive = @IsActive , 
/*15868*/ 		UTCDateModified = GetUTCDate()
/*15869*/ , 
/*15870*/ 		StampUserName = @StampUserName 
/*15871*/ 	WHERE
/*15872*/ 		RoleId = @RoleId AND 
/*15873*/ 		ModuleName = @ModuleName AND 
/*15874*/ 		ConcurrencyId = @ConcurrencyId
/*15875*/ 
/*15876*/ 	IF @@ROWCOUNT = 0
/*15877*/ 		BEGIN
/*15878*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*15879*/ 		RETURN
/*15880*/ 		END
/*15881*/ 	
/*15882*/ 	SELECT
/*15883*/ 		@NewConcurrencyId = ConcurrencyId,
/*15884*/ 		@NewUTCDate = UTCDateModified
/*15885*/ 	FROM [dbo].[FltRoleModulePermissions]
/*15886*/ 	WHERE 
/*15887*/ 		RoleId = @RoleId AND 
/*15888*/ 		ModuleName = @ModuleName
/*15889*/ 
/*15890*/ END
/*15891*/ GO
/*15892*/ SET ANSI_NULLS ON
/*15893*/ GO
/*15894*/ SET QUOTED_IDENTIFIER ON
/*15895*/ GO
/*15896*/ 
-- ===== updateFltUser (database/FLT_Schema.sql:15897-15985) =====
/*15897*/ CREATE PROCEDURE [dbo].[updateFltUser]
/*15898*/ 	@UserName nvarchar(20),
/*15899*/ 	@Password nvarchar(128),
/*15900*/ 	@PasswordSalt nvarchar(128) = '',
/*15901*/ 	@Email nvarchar(255),
/*15902*/ 	@PasswordQuestion nvarchar(255) = '',
/*15903*/ 	@PasswordAnswer nvarchar(128) = '',
/*15904*/ 	@IsSuperUser bit = 0,
/*15905*/ 	@IsApproved bit = 1,
/*15906*/ 	@IsLockedOut bit = 0,
/*15907*/ 	@utcLastLoginDate datetime = Null,
/*15908*/ 	@utcLastLockoutDate datetime = Null,
/*15909*/ 	@utcLastPasswordChangedDate datetime = Null,
/*15910*/ 	@FailedPasswordAttemptCount Int = 0,
/*15911*/ 	@utcFailedPasswordAttemptWindowStart datetime = Null,
/*15912*/ 	@FailedPasswordAnswerAttemptCount Int = 0,
/*15913*/ 	@utcFailedPasswordAnswerAttemptWindowStart datetime = Null,
/*15914*/ 	@DisplayName nvarchar(30) = '',
/*15915*/ 	@Location nvarchar(30) = '',
/*15916*/ 	@CountryCode nvarchar(20) = '',
/*15917*/ 	@PhoneNumber nvarchar(20) = '',
/*15918*/ 	@MgrUserName nvarchar(20) = '',
/*15919*/ 	@Department nvarchar(30) = '',
/*15920*/ 	@Title nvarchar(30) = '',
/*15921*/ 	@Company nvarchar(30) = '',
/*15922*/ 	@DefaultProgId Int = 0,
/*15923*/ 	@IsActive bit, 
/*15924*/ 	@StampUserName nvarchar(20), 
/*15925*/ 	@ConcurrencyId bigint,
/*15926*/ 	@NewConcurrencyId bigint OUTPUT,
/*15927*/ 	@NewUTCDate datetime OUTPUT
/*15928*/ AS
/*15929*/ BEGIN
/*15930*/ 	SET NOCOUNT ON
/*15931*/ 
/*15932*/ 	UPDATE [dbo].[FltUser]
/*15933*/ 	SET
/*15934*/ 		Password = @Password, 
/*15935*/ 		PasswordSalt = @PasswordSalt, 
/*15936*/ 		Email = @Email, 
/*15937*/ 		PasswordQuestion = @PasswordQuestion, 
/*15938*/ 		PasswordAnswer = @PasswordAnswer, 
/*15939*/ 		IsSuperUser = @IsSuperUser, 
/*15940*/ 		IsApproved = @IsApproved, 
/*15941*/ 		IsLockedOut = @IsLockedOut, 
/*15942*/ 		utcLastLoginDate = @utcLastLoginDate, 
/*15943*/ 		utcLastLockoutDate = @utcLastLockoutDate, 
/*15944*/ 		utcLastPasswordChangedDate = @utcLastPasswordChangedDate, 
/*15945*/ 		FailedPasswordAttemptCount = @FailedPasswordAttemptCount, 
/*15946*/ 		utcFailedPasswordAttemptWindowStart = @utcFailedPasswordAttemptWindowStart, 
/*15947*/ 		FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount, 
/*15948*/ 		utcFailedPasswordAnswerAttemptWindowStart = @utcFailedPasswordAnswerAttemptWindowStart, 
/*15949*/ 		DisplayName = @DisplayName, 
/*15950*/ 		Location = @Location, 
/*15951*/ 		CountryCode = @CountryCode, 
/*15952*/ 		PhoneNumber = @PhoneNumber, 
/*15953*/ 		MgrUserName = @MgrUserName, 
/*15954*/ 		Department = @Department, 
/*15955*/ 		Title = @Title, 
/*15956*/ 		Company = @Company, 
/*15957*/ 		DefaultProgId = @DefaultProgId, 
/*15958*/ 		IsActive = @IsActive , 
/*15959*/ 		UTCDateModified = GetUTCDate()
/*15960*/ , 
/*15961*/ 		StampUserName = @StampUserName 
/*15962*/ 	WHERE
/*15963*/ 		UserName = @UserName AND 
/*15964*/ 		ConcurrencyId = @ConcurrencyId
/*15965*/ 
/*15966*/ 	IF @@ROWCOUNT = 0
/*15967*/ 		BEGIN
/*15968*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*15969*/ 		RETURN
/*15970*/ 		END
/*15971*/ 	
/*15972*/ 	SELECT
/*15973*/ 		@NewConcurrencyId = ConcurrencyId,
/*15974*/ 		@NewUTCDate = UTCDateModified
/*15975*/ 	FROM [dbo].[FltUser]
/*15976*/ 	WHERE 
/*15977*/ 		UserName = @UserName
/*15978*/ 
/*15979*/ END
/*15980*/ GO
/*15981*/ SET ANSI_NULLS ON
/*15982*/ GO
/*15983*/ SET QUOTED_IDENTIFIER ON
/*15984*/ GO
/*15985*/ 
-- ===== updateDocument (database/FLT_Schema.sql:16027-16075) =====
/*16027*/ CREATE PROCEDURE [dbo].[updateDocument]
/*16028*/ 	@DocId int,
/*16029*/ 	@ProgId Int,
/*16030*/ 	@DocTypeId Int,
/*16031*/ 	@DocFileName varchar(255),
/*16032*/ 	@DocDescription nvarchar(255) = '',
/*16033*/ 	@IsActive bit, 
/*16034*/ 	@StampUserName nvarchar(20), 
/*16035*/ 	@ConcurrencyId bigint,
/*16036*/ 	@NewConcurrencyId bigint OUTPUT,
/*16037*/ 	@NewUTCDate datetime OUTPUT
/*16038*/ AS
/*16039*/ BEGIN
/*16040*/ 	SET NOCOUNT ON
/*16041*/ 
/*16042*/ 	UPDATE [dbo].[Document]
/*16043*/ 	SET
/*16044*/ 		ProgId = @ProgId, 
/*16045*/ 		DocTypeId = @DocTypeId, 
/*16046*/ 		DocFileName = @DocFileName, 
/*16047*/ 		DocDescription = @DocDescription, 
/*16048*/ 		IsActive = @IsActive , 
/*16049*/ 		UTCDateModified = GetUTCDate()
/*16050*/ , 
/*16051*/ 		StampUserName = @StampUserName 
/*16052*/ 	WHERE
/*16053*/ 		DocId = @DocId AND 
/*16054*/ 		ConcurrencyId = @ConcurrencyId
/*16055*/ 
/*16056*/ 	IF @@ROWCOUNT = 0
/*16057*/ 		BEGIN
/*16058*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*16059*/ 		RETURN
/*16060*/ 		END
/*16061*/ 	
/*16062*/ 	SELECT
/*16063*/ 		@NewConcurrencyId = ConcurrencyId,
/*16064*/ 		@NewUTCDate = UTCDateModified
/*16065*/ 	FROM [dbo].[Document]
/*16066*/ 	WHERE 
/*16067*/ 		DocId = @DocId
/*16068*/ 
/*16069*/ END
/*16070*/ GO
/*16071*/ SET ANSI_NULLS ON
/*16072*/ GO
/*16073*/ SET QUOTED_IDENTIFIER ON
/*16074*/ GO
/*16075*/ 
-- ===== updateDocumentInfo (database/FLT_Schema.sql:16076-16125) =====
/*16076*/ CREATE PROCEDURE [dbo].[updateDocumentInfo]
/*16077*/ 	@DocumentId int,
/*16078*/ 	@ProgId Int,
/*16079*/ 	@DocumentTypeId Int,
/*16080*/ 	@DocumentName varchar(255),
/*16081*/ 	@DocumentDescription nvarchar(255) = '',
/*16082*/ 	@DocumentSize INT,
/*16083*/ 	@IsDeleted bit, 
/*16084*/ 	@StampUserName nvarchar(20), 
/*16085*/ 	@ConcurrencyId bigint,
/*16086*/ 	@NewConcurrencyId bigint OUTPUT,
/*16087*/ 	@NewUTCDate datetime OUTPUT
/*16088*/ AS
/*16089*/ BEGIN
/*16090*/ 	SET NOCOUNT ON
/*16091*/ 
/*16092*/ 	UPDATE [dbo].[DocumentInfo]
/*16093*/ 	SET
/*16094*/ 		ProgId = @ProgId, 
/*16095*/ 		DocumentTypeId = @DocumentTypeId, 
/*16096*/ 		DocumentName = @DocumentName, 
/*16097*/ 		DocumentDescription = @DocumentDescription, 
/*16098*/ 		DocumentSize = @DocumentSize,
/*16099*/ 		IsDeleted = @IsDeleted, 
/*16100*/ 		UTCDateModified = GetUTCDate(), 
/*16101*/ 		StampUserName = @StampUserName 
/*16102*/ 	WHERE
/*16103*/ 		DocumentId = @DocumentId AND 
/*16104*/ 		ConcurrencyId = @ConcurrencyId
/*16105*/ 
/*16106*/ 	IF @@ROWCOUNT = 0
/*16107*/ 		BEGIN
/*16108*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*16109*/ 		RETURN
/*16110*/ 		END
/*16111*/ 	
/*16112*/ 	SELECT
/*16113*/ 		@NewConcurrencyId = ConcurrencyId,
/*16114*/ 		@NewUTCDate = UTCDateModified
/*16115*/ 	FROM [dbo].[DocumentInfo]
/*16116*/ 	WHERE 
/*16117*/ 		DocumentId = @DocumentId
/*16118*/ 
/*16119*/ END
/*16120*/ GO
/*16121*/ SET ANSI_NULLS ON
/*16122*/ GO
/*16123*/ SET QUOTED_IDENTIFIER ON
/*16124*/ GO
/*16125*/ 
-- ===== updateDocumentType (database/FLT_Schema.sql:16126-16162) =====
/*16126*/ CREATE PROCEDURE [dbo].[updateDocumentType]
/*16127*/ 	@DocumentTypeId int,
/*16128*/ 	@FileExtension VARCHAR(10),
/*16129*/ 	@MimeType VARCHAR(255),
/*16130*/ 	@ConcurrencyId bigint,
/*16131*/ 	@NewConcurrencyId bigint OUTPUT
/*16132*/ AS
/*16133*/ BEGIN
/*16134*/ 	SET NOCOUNT ON
/*16135*/ 
/*16136*/ 	UPDATE [dbo].[DocumentType]
/*16137*/ 	SET
/*16138*/ 		FileExtension = @FileExtension,
/*16139*/ 		MimeType = @MimeType
/*16140*/ 	WHERE
/*16141*/ 		DocumentTypeId = @DocumentTypeId AND 
/*16142*/ 		ConcurrencyId = @ConcurrencyId
/*16143*/ 
/*16144*/ 	IF @@ROWCOUNT = 0
/*16145*/ 		BEGIN
/*16146*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*16147*/ 		RETURN
/*16148*/ 		END
/*16149*/ 	
/*16150*/ 	SELECT
/*16151*/ 		@NewConcurrencyId = ConcurrencyId
/*16152*/ 	FROM [dbo].[DocumentType]
/*16153*/ 	WHERE 
/*16154*/ 		DocumentTypeId = @DocumentTypeId
/*16155*/ 
/*16156*/ END
/*16157*/ GO
/*16158*/ SET ANSI_NULLS ON
/*16159*/ GO
/*16160*/ SET QUOTED_IDENTIFIER ON
/*16161*/ GO
/*16162*/ 
-- ===== updateLiquidFill (database/FLT_Schema.sql:16467-16525) =====
/*16467*/ CREATE PROCEDURE [dbo].[updateLiquidFill]
/*16468*/ 	@LiquidFillId int,
/*16469*/ 	@FlightId Int,
/*16470*/ 	@LiquidGroupId Int,
/*16471*/ 	@LiquidTypeId Int,
/*16472*/ 	@LiquidUnitId Int,
/*16473*/ 	@LiquidAmt DECIMAL(9,3),
/*16474*/ 	@HobbsReading DECIMAL(9,1),
/*16475*/ 	@AirframeHoursReading DECIMAL(9,1),
/*16476*/ 	@LiquidFillLocation nvarchar(255),
/*16477*/ 	@LiquidFillApprover NVARCHAR(30),
/*16478*/ 	@IsActive bit, 
/*16479*/ 	@StampUserName nvarchar(20), 
/*16480*/ 	@ConcurrencyId bigint,
/*16481*/ 	@NewConcurrencyId bigint OUTPUT,
/*16482*/ 	@NewUTCDate datetime OUTPUT
/*16483*/ AS
/*16484*/ BEGIN
/*16485*/ 	SET NOCOUNT ON
/*16486*/ 
/*16487*/ 	UPDATE [dbo].[LiquidFill]
/*16488*/ 	SET
/*16489*/ 		FlightId = @FlightId, 
/*16490*/ 		LiquidGroupId = @LiquidGroupId, 
/*16491*/ 		LiquidTypeId = @LiquidTypeId, 
/*16492*/ 		LiquidUnitId = @LiquidUnitId, 
/*16493*/ 		LiquidAmt = @LiquidAmt, 
/*16494*/ 		HobbsReading = @HobbsReading, 
/*16495*/ 		AirframeHoursReading = @AirframeHoursReading,
/*16496*/ 		LiquidFillLocation = @LiquidFillLocation, 
/*16497*/ 		LiquidFillApprover = @LiquidFillApprover,
/*16498*/ 		IsActive = @IsActive , 
/*16499*/ 		UTCDateModified = GetUTCDate(), 
/*16500*/ 		StampUserName = @StampUserName 
/*16501*/ 	WHERE
/*16502*/ 		LiquidFillId = @LiquidFillId AND 
/*16503*/ 		ConcurrencyId = @ConcurrencyId
/*16504*/ 
/*16505*/ 	IF @@ROWCOUNT = 0
/*16506*/ 		BEGIN
/*16507*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*16508*/ 		RETURN
/*16509*/ 		END
/*16510*/ 	
/*16511*/ 	SELECT
/*16512*/ 		@NewConcurrencyId = ConcurrencyId,
/*16513*/ 		@NewUTCDate = UTCDateModified
/*16514*/ 	FROM [dbo].[LiquidFill]
/*16515*/ 	WHERE 
/*16516*/ 		LiquidFillId = @LiquidFillId
/*16517*/ 
/*16518*/ END
/*16519*/ 
/*16520*/ GO
/*16521*/ SET ANSI_NULLS ON
/*16522*/ GO
/*16523*/ SET QUOTED_IDENTIFIER ON
/*16524*/ GO
/*16525*/ 
-- ===== updateLocation (database/FLT_Schema.sql:16649-16695) =====
/*16649*/ CREATE PROCEDURE [dbo].[updateLocation]
/*16650*/ 	@LocactionId int,
/*16651*/ 	@ProgId Int,
/*16652*/ 	@TimeZoneId Int,
/*16653*/ 	@LocationName nvarchar(50),
/*16654*/ 	@IsActive bit, 
/*16655*/ 	@StampUserName nvarchar(20), 
/*16656*/ 	@ConcurrencyId bigint,
/*16657*/ 	@NewConcurrencyId bigint OUTPUT,
/*16658*/ 	@NewUTCDate datetime OUTPUT
/*16659*/ AS
/*16660*/ BEGIN
/*16661*/ 	SET NOCOUNT ON
/*16662*/ 
/*16663*/ 	UPDATE [dbo].[Location]
/*16664*/ 	SET
/*16665*/ 		ProgId = @ProgId, 
/*16666*/ 		TimeZoneId = @TimeZoneId, 
/*16667*/ 		LocationName = @LocationName, 
/*16668*/ 		IsActive = @IsActive , 
/*16669*/ 		UTCDateModified = GetUTCDate()
/*16670*/ , 
/*16671*/ 		StampUserName = @StampUserName 
/*16672*/ 	WHERE
/*16673*/ 		LocactionId = @LocactionId AND 
/*16674*/ 		ConcurrencyId = @ConcurrencyId
/*16675*/ 
/*16676*/ 	IF @@ROWCOUNT = 0
/*16677*/ 		BEGIN
/*16678*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*16679*/ 		RETURN
/*16680*/ 		END
/*16681*/ 	
/*16682*/ 	SELECT
/*16683*/ 		@NewConcurrencyId = ConcurrencyId,
/*16684*/ 		@NewUTCDate = UTCDateModified
/*16685*/ 	FROM [dbo].[Location]
/*16686*/ 	WHERE 
/*16687*/ 		LocactionId = @LocactionId
/*16688*/ 
/*16689*/ END
/*16690*/ GO
/*16691*/ SET ANSI_NULLS ON
/*16692*/ GO
/*16693*/ SET QUOTED_IDENTIFIER ON
/*16694*/ GO
/*16695*/ 
-- ===== updateProgram (database/FLT_Schema.sql:16860-16936) =====
/*16860*/ CREATE PROCEDURE [dbo].[updateProgram]
/*16861*/ 	@ProgID int,
/*16862*/ 	@ProgName nvarchar(50),
/*16863*/ 	@ProgDescription nvarchar(255) = '',
/*16864*/ 	@ProgVersion nvarchar(50) = '',
/*16865*/ 	@ProgramLogo nvarchar(255) = '',
/*16866*/ 	@ReportLogo nvarchar(255) = '',
/*16867*/ 	@YearLogo nvarchar(255) = '',
/*16868*/ 	@ProgStatus tinyint = 0,
/*16869*/ 	@DateOpened varchar(50) = '',
/*16870*/ 	@DateClosed varchar(50) = '',
/*16871*/ 	@ActualValue money = 0,
/*16872*/ 	@ProjectCode varchar(50) = '',
/*16873*/ 	@ActivityCode varchar(50) = '',
/*16874*/ 	@DeptCode varchar(50) = '',
/*16875*/ 	@CompanyName nvarchar(255) = '',
/*16876*/ 	@NearEndUsage Int = 0,
/*16877*/ 	@AvgDailyUsage Int = 0,
/*16878*/ 	@WeeklyFlightDays Int = 0,
/*16879*/ 	@ProgramGuid uniqueIdentifier,
/*16880*/ 	@IsActive bit, 
/*16881*/ 	@StampUserName nvarchar(20), 
/*16882*/ 	@ConcurrencyId bigint,
/*16883*/ 	@NewConcurrencyId bigint OUTPUT,
/*16884*/ 	@NewUTCDate datetime OUTPUT
/*16885*/ AS
/*16886*/ BEGIN
/*16887*/ 	SET NOCOUNT ON
/*16888*/ 
/*16889*/ 	UPDATE [dbo].[Program]
/*16890*/ 	SET
/*16891*/ 		ProgName = @ProgName, 
/*16892*/ 		ProgDescription = @ProgDescription, 
/*16893*/ 		ProgVersion = @ProgVersion, 
/*16894*/ 		ProgramLogo = @ProgramLogo, 
/*16895*/ 		ReportLogo = @ReportLogo, 
/*16896*/ 		YearLogo = @YearLogo, 
/*16897*/ 		ProgStatus = @ProgStatus, 
/*16898*/ 		DateOpened = @DateOpened, 
/*16899*/ 		DateClosed = @DateClosed, 
/*16900*/ 		ActualValue = @ActualValue, 
/*16901*/ 		ProjectCode = @ProjectCode, 
/*16902*/ 		ActivityCode = @ActivityCode, 
/*16903*/ 		DeptCode = @DeptCode, 
/*16904*/ 		CompanyName = @CompanyName, 
/*16905*/ 		NearEndUsage = @NearEndUsage, 
/*16906*/ 		AvgDailyUsage = @AvgDailyUsage, 
/*16907*/ 		WeeklyFlightDays = @WeeklyFlightDays, 
/*16908*/ 		ProgramGuid = @ProgramGuid, 
/*16909*/ 		IsActive = @IsActive , 
/*16910*/ 		UTCDateModified = GetUTCDate()
/*16911*/ , 
/*16912*/ 		StampUserName = @StampUserName 
/*16913*/ 	WHERE
/*16914*/ 		ProgID = @ProgID AND 
/*16915*/ 		ConcurrencyId = @ConcurrencyId
/*16916*/ 
/*16917*/ 	IF @@ROWCOUNT = 0
/*16918*/ 		BEGIN
/*16919*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*16920*/ 		RETURN
/*16921*/ 		END
/*16922*/ 	
/*16923*/ 	SELECT
/*16924*/ 		@NewConcurrencyId = ConcurrencyId,
/*16925*/ 		@NewUTCDate = UTCDateModified
/*16926*/ 	FROM [dbo].[Program]
/*16927*/ 	WHERE 
/*16928*/ 		ProgID = @ProgID
/*16929*/ 
/*16930*/ END
/*16931*/ GO
/*16932*/ SET ANSI_NULLS ON
/*16933*/ GO
/*16934*/ SET QUOTED_IDENTIFIER ON
/*16935*/ GO
/*16936*/ 
-- ===== updateRoute (database/FLT_Schema.sql:16937-16985) =====
/*16937*/ CREATE PROCEDURE [dbo].[updateRoute]
/*16938*/ 	@RouteId int,
/*16939*/ 	@LocationId Int,
/*16940*/ 	@Name nvarchar(50),
/*16941*/ 	@Description nvarchar(255),
/*16942*/ 	@TimeZoneId int,
/*16943*/ 	@IsActive bit, 
/*16944*/ 	@StampUserName nvarchar(20), 
/*16945*/ 	@ConcurrencyId bigint,
/*16946*/ 	@NewConcurrencyId bigint OUTPUT,
/*16947*/ 	@NewUTCDate datetime OUTPUT
/*16948*/ AS
/*16949*/ BEGIN
/*16950*/ 	SET NOCOUNT ON
/*16951*/ 
/*16952*/ 	UPDATE [dbo].[Route]
/*16953*/ 	SET
/*16954*/ 		LocationId = @LocationId, 
/*16955*/ 		Name = @Name, 
/*16956*/ 		Description = @Description, 
/*16957*/ 		TimeZoneId = @TimeZoneId, 
/*16958*/ 		IsActive = @IsActive , 
/*16959*/ 		UTCDateModified = GetUTCDate()
/*16960*/ , 
/*16961*/ 		StampUserName = @StampUserName 
/*16962*/ 	WHERE
/*16963*/ 		RouteId = @RouteId AND 
/*16964*/ 		ConcurrencyId = @ConcurrencyId
/*16965*/ 
/*16966*/ 	IF @@ROWCOUNT = 0
/*16967*/ 		BEGIN
/*16968*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*16969*/ 		RETURN
/*16970*/ 		END
/*16971*/ 	
/*16972*/ 	SELECT
/*16973*/ 		@NewConcurrencyId = ConcurrencyId,
/*16974*/ 		@NewUTCDate = UTCDateModified
/*16975*/ 	FROM [dbo].[Route]
/*16976*/ 	WHERE 
/*16977*/ 		RouteId = @RouteId
/*16978*/ 
/*16979*/ END
/*16980*/ GO
/*16981*/ SET ANSI_NULLS ON
/*16982*/ GO
/*16983*/ SET QUOTED_IDENTIFIER ON
/*16984*/ GO
/*16985*/ 
-- ===== updateRegion (database/FLT_Schema.sql:17027-17067) =====
/*17027*/ CREATE PROCEDURE [dbo].[updateRegion]
/*17028*/ 	@Id int,
/*17029*/ 	@ProgId Int,
/*17030*/ 	@Code nvarchar(2),
/*17031*/ 	@Name nvarchar(255),
/*17032*/ 	@IsActive bit, 
/*17033*/ 	@ConcurrencyId bigint,
/*17034*/ 	@NewConcurrencyId bigint OUTPUT
/*17035*/ AS
/*17036*/ BEGIN
/*17037*/ 	SET NOCOUNT ON
/*17038*/ 
/*17039*/ 	UPDATE [dbo].[Region]
/*17040*/ 	SET
/*17041*/ 		ProgId = @ProgId, 
/*17042*/ 		Code = @Code, 
/*17043*/ 		Name = @Name, 
/*17044*/ 		IsActive = @IsActive  
/*17045*/ 	WHERE
/*17046*/ 		Id = @Id AND 
/*17047*/ 		ConcurrencyId = @ConcurrencyId
/*17048*/ 
/*17049*/ 	IF @@ROWCOUNT = 0
/*17050*/ 		BEGIN
/*17051*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*17052*/ 		RETURN
/*17053*/ 		END
/*17054*/ 	
/*17055*/ 	SELECT
/*17056*/ 		@NewConcurrencyId = ConcurrencyId
/*17057*/ 	FROM [dbo].[Region]
/*17058*/ 	WHERE 
/*17059*/ 		Id = @Id
/*17060*/ 
/*17061*/ END
/*17062*/ GO
/*17063*/ SET ANSI_NULLS ON
/*17064*/ GO
/*17065*/ SET QUOTED_IDENTIFIER ON
/*17066*/ GO
/*17067*/ 
-- ===== updateUTCTimeZone (database/FLT_Schema.sql:17545-17593) =====
/*17545*/ CREATE PROCEDURE [dbo].[updateUTCTimeZone]
/*17546*/ 	@TimeZoneId INT,
/*17547*/ 	@TimeZoneCode varchar(10),
/*17548*/ 	@TimeZoneOffset float,
/*17549*/ 	@TimeZoneDescr nvarchar(255),
/*17550*/ 	@DaylightSavingTime BIT,
/*17551*/ 	@DaylightSavingOffset FLOAT,
/*17552*/ 	@DaylightSavingBegin DATETIME,
/*17553*/ 	@DaylightSavingEnd DATETIME,
/*17554*/ 	@IsActive bit, 
/*17555*/ 	@ConcurrencyId bigint,
/*17556*/ 	@NewConcurrencyId bigint OUTPUT
/*17557*/ AS
/*17558*/ BEGIN
/*17559*/ 	SET NOCOUNT ON
/*17560*/ 
/*17561*/ 	UPDATE [dbo].[UTCTimeZone]
/*17562*/ 	SET
/*17563*/ 		TimeZoneCode = @TimeZoneCode,
/*17564*/ 		TimeZoneOffset = @TimeZoneOffset, 
/*17565*/ 		TimeZoneDescr = @TimeZoneDescr, 
/*17566*/ 		DaylightSavingTime = @DaylightSavingTime,
/*17567*/ 		DaylightSavingOffset = @DaylightSavingOffset,
/*17568*/ 		DaylightSavingBegin = @DaylightSavingBegin,
/*17569*/ 		DaylightSavingEnd = @DaylightSavingEnd,
/*17570*/ 		IsActive = @IsActive  
/*17571*/ 	WHERE
/*17572*/ 		TimeZoneId = @TimeZoneId AND 
/*17573*/ 		ConcurrencyId = @ConcurrencyId
/*17574*/ 
/*17575*/ 	IF @@ROWCOUNT = 0
/*17576*/ 		BEGIN
/*17577*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*17578*/ 		RETURN
/*17579*/ 		END
/*17580*/ 	
/*17581*/ 	SELECT
/*17582*/ 		@NewConcurrencyId = ConcurrencyId
/*17583*/ 	FROM [dbo].[UTCTimeZone]
/*17584*/ 	WHERE 
/*17585*/ 		TimeZoneId = @TimeZoneId
/*17586*/ 
/*17587*/ END
/*17588*/ GO
/*17589*/ SET ANSI_NULLS ON
/*17590*/ GO
/*17591*/ SET QUOTED_IDENTIFIER ON
/*17592*/ GO
/*17593*/ 
-- ===== updateAircraft (database/FLT_Schema.sql:17594-17678) =====
/*17594*/ CREATE PROCEDURE [dbo].[updateAircraft]
/*17595*/ 	@AircraftId Int,
/*17596*/ 	@ProgId Int,
/*17597*/ 	@CurrentLocationId INT,
/*17598*/ 	@MSN varchar(20),
/*17599*/ 	@ShipNbr varchar(15),
/*17600*/ 	@SerialNbr varchar(6),
/*17601*/ 	@ModelId Int,
/*17602*/ 	@Description nvarchar(255),
/*17603*/ 	@EngineerId Int,
/*17604*/ 	@MechanicId Int,
/*17605*/ 	@RegistrationNbr varchar(10),
/*17606*/ 	@LiveryColor varchar(10),
/*17607*/ 	@AircraftStatusId Int,
/*17608*/ 	@ManufacturerId Int,
/*17609*/ 	@AirframeHoursStart DECIMAL(9,1),
/*17610*/ 	@AirframeHoursCurrent DECIMAL(9,1), 
/*17611*/ 	@AirframeHoursOffset DECIMAL(9,1),
/*17612*/ 	@MeterUnitId INT,
/*17613*/ 	@TotalRequiredUsage DECIMAL(7,1),
/*17614*/ 	@AircraftEngineHoursCurrent DECIMAL(11,1) = 0,
/*17615*/ 	@EstEndOfTesting DATETIME,
/*17616*/ 	@ActEndOfTesting DATETIME,
/*17617*/ 	@AircraftGuid uniqueIdentifier,
/*17618*/ 	@IsActive bit, 
/*17619*/ 	@StampUserName nvarchar(20), 
/*17620*/ 	@ConcurrencyId bigint,
/*17621*/ 	@NewConcurrencyId bigint OUTPUT,
/*17622*/ 	@NewUTCDate datetime OUTPUT
/*17623*/ AS
/*17624*/ BEGIN
/*17625*/ 	SET NOCOUNT ON
/*17626*/ 
/*17627*/ 	UPDATE [dbo].[Aircraft]
/*17628*/ 	SET
/*17629*/ 		ProgId = @ProgId, 
/*17630*/ 		CurrentLocationId = @CurrentLocationid,
/*17631*/ 		MSN = @MSN, 
/*17632*/ 		ShipNbr = @ShipNbr, 
/*17633*/ 		SerialNbr = @SerialNbr, 
/*17634*/ 		ModelId = @ModelId, 
/*17635*/ 		Description = @Description, 
/*17636*/ 		EngineerId = @EngineerId, 
/*17637*/ 		MechanicId = @MechanicId, 
/*17638*/ 		RegistrationNbr = @RegistrationNbr, 
/*17639*/ 		LiveryColor = @LiveryColor, 
/*17640*/ 		AircraftStatusId = @AircraftStatusId, 
/*17641*/ 		ManufacturerId = @ManufacturerId, 
/*17642*/ 		AirframeHoursStart = @AirframeHoursStart, 
/*17643*/ 		AirframeHoursCurrent = @AirframeHoursCurrent,
/*17644*/ 		AirframeHoursOffset = @AirframeHoursOffset,
/*17645*/ 		MeterUnitId = @MeterUnitId,
/*17646*/ 		TotalRequiredUsage = @TotalRequiredUsage,
/*17647*/ 		AircraftEngineHoursCurrent = @AircraftEngineHoursCurrent,
/*17648*/ 		EstEndOfTesting = @EstEndOfTesting,
/*17649*/ 		ActEndOfTesting = @ActEndOfTesting,
/*17650*/ 		AircraftGuid = @AircraftGuid, 
/*17651*/ 		IsActive = @IsActive , 
/*17652*/ 		UTCDateModified = GetUTCDate(), 
/*17653*/ 		StampUserName = @StampUserName 
/*17654*/ 	WHERE
/*17655*/ 		AircraftId = @AircraftId AND 
/*17656*/ 		ConcurrencyId = @ConcurrencyId
/*17657*/ 
/*17658*/ 	IF @@ROWCOUNT = 0
/*17659*/ 		BEGIN
/*17660*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*17661*/ 		RETURN
/*17662*/ 		END
/*17663*/ 	
/*17664*/ 	SELECT
/*17665*/ 		@NewConcurrencyId = ConcurrencyId,
/*17666*/ 		@NewUTCDate = UTCDateModified
/*17667*/ 	FROM [dbo].[Aircraft]
/*17668*/ 	WHERE 
/*17669*/ 		AircraftId = @AircraftId
/*17670*/ 
/*17671*/ END
/*17672*/ 
/*17673*/ GO
/*17674*/ SET ANSI_NULLS ON
/*17675*/ GO
/*17676*/ SET QUOTED_IDENTIFIER ON
/*17677*/ GO
/*17678*/ 
-- ===== updateAircraftComment (database/FLT_Schema.sql:17679-17730) =====
/*17679*/ CREATE PROCEDURE [dbo].[updateAircraftComment]
/*17680*/ 	@AircraftCommentId int,
/*17681*/ 	@AircraftId Int,
/*17682*/ 	@EngineerId INT,
/*17683*/ 	@ComponentId INT,
/*17684*/ 	@CommentDate DATETIME,
/*17685*/ 	@CommentRating SMALLINT,
/*17686*/ 	@IssueCodeId INT,
/*17687*/ 	@Comments nvarchar(2048),
/*17688*/ 	@StampUserName nvarchar(20), 
/*17689*/ 	@ConcurrencyId bigint,
/*17690*/ 	@NewConcurrencyId bigint OUTPUT,
/*17691*/ 	@NewUTCDate datetime OUTPUT
/*17692*/ AS
/*17693*/ BEGIN
/*17694*/ 	SET NOCOUNT ON
/*17695*/ 
/*17696*/ 	UPDATE [dbo].[AircraftComment]
/*17697*/ 	SET
/*17698*/ 		AircraftId = @AircraftId, 
/*17699*/ 		EngineerId = @EngineerId,
/*17700*/ 		ComponentId = @ComponentId,
/*17701*/ 		CommentDate = @CommentDate,
/*17702*/ 		CommentRating = @CommentRating,
/*17703*/ 		IssueCodeId = @IssueCodeId,
/*17704*/ 		Comments = @Comments, 
/*17705*/ 		UTCDateModified = GetUTCDate(), 
/*17706*/ 		StampUserName = @StampUserName 
/*17707*/ 	WHERE
/*17708*/ 		AircraftCommentId = @AircraftCommentId AND 
/*17709*/ 		ConcurrencyId = @ConcurrencyId
/*17710*/ 
/*17711*/ 	IF @@ROWCOUNT = 0
/*17712*/ 		BEGIN
/*17713*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*17714*/ 		RETURN
/*17715*/ 		END
/*17716*/ 	
/*17717*/ 	SELECT
/*17718*/ 		@NewConcurrencyId = ConcurrencyId,
/*17719*/ 		@NewUTCDate = UTCDateModified
/*17720*/ 	FROM [dbo].[AircraftComment]
/*17721*/ 	WHERE 
/*17722*/ 		AircraftCommentId = @AircraftCommentId
/*17723*/ 
/*17724*/ END
/*17725*/ GO
/*17726*/ SET ANSI_NULLS ON
/*17727*/ GO
/*17728*/ SET QUOTED_IDENTIFIER ON
/*17729*/ GO
/*17730*/ 
-- ===== updateAircraftConfiguration (database/FLT_Schema.sql:17772-17858) =====
/*17772*/ CREATE PROCEDURE [dbo].[updateAircraftConfiguration]
/*17773*/ 	@AircraftConfigurationId int,
/*17774*/ 	@AircraftId Int,
/*17775*/ 	@ConfigurationDescription nvarchar(255),
/*17776*/ 	@ConfigurationStartDate datetime,
/*17777*/ 	@ConfigurationEndDate DATETIME = null,
/*17778*/ 	@ConfigurationMeterStart DECIMAL(9,1) = 0,
/*17779*/ 	@ConfigurationMeterEnd DECIMAL(9,1) = 0,
/*17780*/ 	@ConfigurationMeterOffset DECIMAL(9,1) = 0,
/*17781*/ 	@MeterUnitId INT,
/*17782*/ 	@ModelId INT,
/*17783*/ 	@EngineTypeId Int,
/*17784*/ 	@EngineEmissionId Int,
/*17785*/ 	@EngineMaturityId Int,
/*17786*/ 	@EngineSerialNbr nvarchar(20),
/*17787*/ 	@APUTypeId Int,
/*17788*/ 	@APUEmissionId Int,
/*17789*/ 	@APUMaturityId Int,
/*17790*/ 	@APUSerialNbr nvarchar(30),
/*17791*/ 	@NoseGear nvarchar(30),
/*17792*/ 	@MainGear nvarchar(30),
/*17793*/ 	@PropellerTypeId Int,
/*17794*/ 	@PropellerModelNbr nvarchar(20),
/*17795*/ 	@PropellerSerialNbr nvarchar(20),
/*17796*/ 	@AvionicsVersion nvarchar(20),
/*17797*/ 	@EmissionLevel NVARCHAR(20),
/*17798*/ 	@StampUserName nvarchar(20), 
/*17799*/ 	@ConcurrencyId bigint,
/*17800*/ 	@NewConcurrencyId bigint OUTPUT,
/*17801*/ 	@NewUTCDate datetime OUTPUT
/*17802*/ AS
/*17803*/ BEGIN
/*17804*/ 	SET NOCOUNT ON
/*17805*/ 
/*17806*/ 	UPDATE [dbo].[AircraftConfiguration]
/*17807*/ 	SET
/*17808*/ 		AircraftId = @AircraftId, 
/*17809*/ 		ConfigurationDescription = @ConfigurationDescription, 
/*17810*/ 		ConfigurationStartDate = @ConfigurationStartDate, 
/*17811*/ 		ConfigurationEndDate = @ConfigurationEndDate, 
/*17812*/ 		ConfigurationMeterStart = @ConfigurationMeterStart, 
/*17813*/ 		ConfigurationMeterEnd = @ConfigurationMeterEnd, 
/*17814*/ 		ConfigurationMeterOffset = @ConfigurationMeterOffset,
/*17815*/ 		MeterUnitId = @MeterUnitId,
/*17816*/ 		ModelId = @ModelId,
/*17817*/ 		EngineTypeId = @EngineTypeId,
/*17818*/ 		EngineEmissionId = @EngineEmissionId,
/*17819*/ 		EngineMaturityId = @EngineMaturityId,
/*17820*/ 		EngineSerialNbr = @EngineSerialNbr,
/*17821*/ 		APUTypeId = @APUTypeId,
/*17822*/ 		APUEmissionId = @APUEmissionId,
/*17823*/ 		APUMaturityId = @APUMaturityId,
/*17824*/ 		APUSerialNbr = @APUSerialNbr,
/*17825*/ 		NoseGear = @NoseGear,
/*17826*/ 		MainGear = @MainGear,
/*17827*/ 		PropellerTypeId = @PropellerTypeId,
/*17828*/ 		PropellerModelNbr = @PropellerModelNbr,
/*17829*/ 		PropellerSerialNbr = @PropellerSerialNbr,
/*17830*/ 		AvionicsVersion = @AvionicsVersion,
/*17831*/ 		EmissionLevel = @EmissionLevel,
/*17832*/ 		UTCDateModified = GetUTCDate(), 
/*17833*/ 		StampUserName = @StampUserName 
/*17834*/ 	WHERE
/*17835*/ 		AircraftConfigurationId = @AircraftConfigurationId AND 
/*17836*/ 		ConcurrencyId = @ConcurrencyId
/*17837*/ 
/*17838*/ 	IF @@ROWCOUNT = 0
/*17839*/ 		BEGIN
/*17840*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*17841*/ 		RETURN
/*17842*/ 		END
/*17843*/ 	
/*17844*/ 	SELECT
/*17845*/ 		@NewConcurrencyId = ConcurrencyId,
/*17846*/ 		@NewUTCDate = UTCDateModified
/*17847*/ 	FROM [dbo].[AircraftConfiguration]
/*17848*/ 	WHERE 
/*17849*/ 		AircraftConfigurationId = @AircraftConfigurationId
/*17850*/ 
/*17851*/ END
/*17852*/ 
/*17853*/ GO
/*17854*/ SET ANSI_NULLS ON
/*17855*/ GO
/*17856*/ SET QUOTED_IDENTIFIER ON
/*17857*/ GO
/*17858*/ 
-- ===== updateAircraftLocation (database/FLT_Schema.sql:17859-17931) =====
/*17859*/ CREATE PROCEDURE [dbo].[updateAircraftLocation]
/*17860*/ 	@AircraftLocationId INT,
/*17861*/ 	@AircraftId Int,
/*17862*/ 	@LocationId Int,
/*17863*/ 	@ArrivalDate DATETIME,
/*17864*/ 	@RequiredUsage DECIMAL(12,1),
/*17865*/ 	@AccumUsage DECIMAL(12,1),
/*17866*/ 	@EstEndOfTest DATETIME = null,
/*17867*/ 	@ActEndOfTest DATETIME = null,
/*17868*/ 	@LastLocation bit = 0,
/*17869*/ 	@IsActive bit, 
/*17870*/ 	@StampUserName nvarchar(20), 
/*17871*/ 	@ConcurrencyId bigint,
/*17872*/ 	@NewConcurrencyId bigint OUTPUT,
/*17873*/ 	@NewUTCDate datetime OUTPUT
/*17874*/ AS
/*17875*/ BEGIN
/*17876*/ 	SET NOCOUNT ON
/*17877*/ 
/*17878*/ 	UPDATE [dbo].[AircraftLocation]
/*17879*/ 	SET
/*17880*/ 		AircraftId = @AircraftId,
/*17881*/ 		LocationId = @LocationId,
/*17882*/ 		ArrivalDate = @ArrivalDate,
/*17883*/ 		RequiredUsage = @RequiredUsage, 
/*17884*/ 		AccumUsage = @AccumUsage, 
/*17885*/ 		EstEndOfTest = @EstEndOfTest, 
/*17886*/ 		ActEndOfTest = @ActEndOfTest, 
/*17887*/ 		LastLocation = @LastLocation, 
/*17888*/ 		IsActive = @IsActive , 
/*17889*/ 		UTCDateModified = GetUTCDate(), 
/*17890*/ 		StampUserName = @StampUserName 
/*17891*/ 	WHERE
/*17892*/ 	    AircraftLocationId = @AircraftLocationId AND
/*17893*/ 		ConcurrencyId = @ConcurrencyId
/*17894*/ 
/*17895*/ 	IF @@ROWCOUNT = 0
/*17896*/ 		BEGIN
/*17897*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*17898*/ 		RETURN
/*17899*/ 		END
/*17900*/ 	
/*17901*/ 	SELECT
/*17902*/ 		@NewConcurrencyId = ConcurrencyId,
/*17903*/ 		@NewUTCDate = UTCDateModified
/*17904*/ 	FROM [dbo].[AircraftLocation]
/*17905*/ 	WHERE 
/*17906*/ 	    AircraftLocationId = @AircraftLocationId		
/*17907*/ 
/*17908*/ 	DECLARE @CurrentLocationId INTEGER
/*17909*/ 	SELECT @CurrentLocationId = ISNULL(LocationId, 0)
/*17910*/ 	FROM dbo.AircraftLocation
/*17911*/ 	WHERE AircraftLocationId = 
/*17912*/ 		(SELECT MAX(AircraftLocationId)
/*17913*/ 		 FROM AircraftLocation 
/*17914*/ 		 WHERE AircraftId = @AircraftId 
/*17915*/ 		 AND LastLocation = 1
/*17916*/ 		 AND IsActive = 1
/*17917*/ 		 AND IsDeleted = 0)
/*17918*/ 	
/*17919*/ 	UPDATE dbo.Aircraft
/*17920*/ 	SET 
/*17921*/ 		CurrentLocationId = @CurrentLocationId,
/*17922*/ 		UTCDateModified = GETUTCDATE(),
/*17923*/ 		StampUserName = @StampUserName
/*17924*/ 	WHERE AircraftId = @AircraftId
/*17925*/ 
/*17926*/ END
/*17927*/ GO
/*17928*/ SET ANSI_NULLS ON
/*17929*/ GO
/*17930*/ SET QUOTED_IDENTIFIER ON
/*17931*/ GO
-- ===== updateWeightDef (database/FLT_Schema.sql:18001-18050) =====
/*18001*/ CREATE PROCEDURE [dbo].[updateWeightDef]
/*18002*/ 	@WeightDefId int,
/*18003*/ 	@WeightDefTypeId INT,
/*18004*/ 	@WeightDefDescr nvarchar(50),
/*18005*/ 	@Weight INT,
/*18006*/ 	@WeightUnitId INT,
/*18007*/ 	@SortOrder Int,
/*18008*/ 	@IsActive BIT,
/*18009*/ 	@IsDeleted BIT,
/*18010*/ 	@StampUserName NVARCHAR(20),
/*18011*/ 	@ConcurrencyId bigint,
/*18012*/ 	@NewConcurrencyId bigint OUTPUT
/*18013*/ AS
/*18014*/ BEGIN
/*18015*/ 	SET NOCOUNT ON
/*18016*/ 
/*18017*/ 	UPDATE [dbo].[WeightDef]
/*18018*/ 	SET
/*18019*/ 		WeightDefTypeId = @WeightDefTypeId,
/*18020*/ 		WeightDefDescr = @WeightDefDescr, 
/*18021*/ 		[Weight] = @Weight,
/*18022*/ 		WeightUnitId = @WeightUnitId,
/*18023*/ 		SortOrder = @SortOrder,
/*18024*/ 		IsActive = @IsActive,
/*18025*/ 		IsDeleted = @IsDeleted,
/*18026*/ 		UtcDateModified = GETUTCDATE(),
/*18027*/ 		StampUserName = @StampUserName
/*18028*/ 	WHERE
/*18029*/ 		WeightDefId = @WeightDefId AND 
/*18030*/ 		ConcurrencyId = @ConcurrencyId
/*18031*/ 
/*18032*/ 	IF @@ROWCOUNT = 0
/*18033*/ 		BEGIN
/*18034*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*18035*/ 		RETURN
/*18036*/ 		END
/*18037*/ 	
/*18038*/ 	SELECT
/*18039*/ 		@NewConcurrencyId = ConcurrencyId
/*18040*/ 	FROM [dbo].[WeightDef]
/*18041*/ 	WHERE 
/*18042*/ 		WeightDefId = @WeightDefId
/*18043*/ 
/*18044*/ END
/*18045*/ GO
/*18046*/ SET ANSI_NULLS ON
/*18047*/ GO
/*18048*/ SET QUOTED_IDENTIFIER ON
/*18049*/ GO
/*18050*/ 
-- ===== updateWeightDefType (database/FLT_Schema.sql:18051-18087) =====
/*18051*/ CREATE PROCEDURE [dbo].[updateWeightDefType]
/*18052*/ 	@WeightDefTypeId int,
/*18053*/ 	@WeightDefTypeDescr nvarchar(50),
/*18054*/ 	@SortOrder Int = 0,
/*18055*/ 	@ConcurrencyId bigint,
/*18056*/ 	@NewConcurrencyId bigint OUTPUT
/*18057*/ AS
/*18058*/ BEGIN
/*18059*/ 	SET NOCOUNT ON
/*18060*/ 
/*18061*/ 	UPDATE [dbo].[WeightDefType]
/*18062*/ 	SET
/*18063*/ 		WeightDefTypeDescr = @WeightDefTypeDescr, 
/*18064*/ 		SortOrder = @SortOrder
/*18065*/ 	WHERE
/*18066*/ 		WeightDefTypeId = @WeightDefTypeId AND 
/*18067*/ 		ConcurrencyId = @ConcurrencyId
/*18068*/ 
/*18069*/ 	IF @@ROWCOUNT = 0
/*18070*/ 		BEGIN
/*18071*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*18072*/ 		RETURN
/*18073*/ 		END
/*18074*/ 	
/*18075*/ 	SELECT
/*18076*/ 		@NewConcurrencyId = ConcurrencyId
/*18077*/ 	FROM [dbo].[WeightDefType]
/*18078*/ 	WHERE 
/*18079*/ 		WeightDefTypeId = @WeightDefTypeId
/*18080*/ 
/*18081*/ END
/*18082*/ GO
/*18083*/ SET ANSI_NULLS ON
/*18084*/ GO
/*18085*/ SET QUOTED_IDENTIFIER ON
/*18086*/ GO
/*18087*/ 
-- ===== updateWOEngineerComment (database/FLT_Schema.sql:18129-18178) =====
/*18129*/ CREATE PROCEDURE [dbo].[updateWOEngineerComment]
/*18130*/ 	@EngineerCommentsId int,
/*18131*/ 	@WorkOrderId Int,
/*18132*/ 	@ComponentId INT,
/*18133*/ 	@CommentDate DATETIME,
/*18134*/ 	@CommentRating SMALLINT,
/*18135*/ 	@IssueCodeId INT,
/*18136*/ 	@Comments nvarchar(2048),
/*18137*/ 	@StampUserName nvarchar(20), 
/*18138*/ 	@ConcurrencyId bigint,
/*18139*/ 	@NewConcurrencyId bigint OUTPUT,
/*18140*/ 	@NewUTCDate datetime OUTPUT
/*18141*/ AS
/*18142*/ BEGIN
/*18143*/ 	SET NOCOUNT ON
/*18144*/ 
/*18145*/ 	UPDATE [dbo].[WOEngineerComment]
/*18146*/ 	SET
/*18147*/ 		WorkOrderId = @WorkOrderId, 
/*18148*/ 		ComponentId = @ComponentId,
/*18149*/ 		CommentDate = @CommentDate,
/*18150*/ 		CommentRating = @CommentRating,
/*18151*/ 		IssueCodeId = @IssueCodeId,
/*18152*/ 		Comments = @Comments, 
/*18153*/ 		UTCDateModified = GetUTCDate(), 
/*18154*/ 		StampUserName = @StampUserName 
/*18155*/ 	WHERE
/*18156*/ 		EngineerCommentsId = @EngineerCommentsId AND 
/*18157*/ 		ConcurrencyId = @ConcurrencyId
/*18158*/ 
/*18159*/ 	IF @@ROWCOUNT = 0
/*18160*/ 		BEGIN
/*18161*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*18162*/ 		RETURN
/*18163*/ 		END
/*18164*/ 	
/*18165*/ 	SELECT
/*18166*/ 		@NewConcurrencyId = ConcurrencyId,
/*18167*/ 		@NewUTCDate = UTCDateModified
/*18168*/ 	FROM [dbo].[WOEngineerComment]
/*18169*/ 	WHERE 
/*18170*/ 		EngineerCommentsId = @EngineerCommentsId
/*18171*/ 
/*18172*/ END
/*18173*/ GO
/*18174*/ SET ANSI_NULLS ON
/*18175*/ GO
/*18176*/ SET QUOTED_IDENTIFIER ON
/*18177*/ GO
/*18178*/ 
-- ===== updateWOInstruction (database/FLT_Schema.sql:18179-18220) =====
/*18179*/ CREATE PROCEDURE [dbo].[updateWOInstruction]
/*18180*/ 	@WOInstructionsId int,
/*18181*/ 	@WorkOrderId Int,
/*18182*/ 	@InstructionLine nvarchar(2048),
/*18183*/ 	@StampUserName nvarchar(20), 
/*18184*/ 	@ConcurrencyId bigint,
/*18185*/ 	@NewConcurrencyId bigint OUTPUT,
/*18186*/ 	@NewUTCDate datetime OUTPUT
/*18187*/ AS
/*18188*/ BEGIN
/*18189*/ 	SET NOCOUNT ON
/*18190*/ 
/*18191*/ 	UPDATE [dbo].[WOInstruction]
/*18192*/ 	SET
/*18193*/ 		WorkOrderId = @WorkOrderId, 
/*18194*/ 		InstructionLine = @InstructionLine, 
/*18195*/ 		UTCDateModified = GetUTCDate(), 
/*18196*/ 		StampUserName = @StampUserName 
/*18197*/ 	WHERE
/*18198*/ 		WOInstructionsId = @WOInstructionsId AND 
/*18199*/ 		ConcurrencyId = @ConcurrencyId
/*18200*/ 
/*18201*/ 	IF @@ROWCOUNT = 0
/*18202*/ 		BEGIN
/*18203*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*18204*/ 		RETURN
/*18205*/ 		END
/*18206*/ 	
/*18207*/ 	SELECT
/*18208*/ 		@NewConcurrencyId = ConcurrencyId,
/*18209*/ 		@NewUTCDate = UTCDateModified
/*18210*/ 	FROM [dbo].[WOInstruction]
/*18211*/ 	WHERE 
/*18212*/ 		WOInstructionsId = @WOInstructionsId
/*18213*/ 
/*18214*/ END
/*18215*/ GO
/*18216*/ SET ANSI_NULLS ON
/*18217*/ GO
/*18218*/ SET QUOTED_IDENTIFIER ON
/*18219*/ GO
/*18220*/ 
-- ===== updateWOPerformedWork (database/FLT_Schema.sql:18221-18262) =====
/*18221*/ CREATE PROCEDURE [dbo].[updateWOPerformedWork]
/*18222*/ 	@PerformedWorkId int,
/*18223*/ 	@WorkOrderId Int,
/*18224*/ 	@PerformedWorkLine nvarchar(2048),
/*18225*/ 	@StampUserName nvarchar(20), 
/*18226*/ 	@ConcurrencyId bigint,
/*18227*/ 	@NewConcurrencyId bigint OUTPUT,
/*18228*/ 	@NewUTCDate datetime OUTPUT
/*18229*/ AS
/*18230*/ BEGIN
/*18231*/ 	SET NOCOUNT ON
/*18232*/ 
/*18233*/ 	UPDATE [dbo].[WOPerformedWork]
/*18234*/ 	SET
/*18235*/ 		WorkOrderId = @WorkOrderId, 
/*18236*/ 		PerformedWorkLine = @PerformedWorkLine, 
/*18237*/ 		UTCDateModified = GetUTCDate(), 
/*18238*/ 		StampUserName = @StampUserName 
/*18239*/ 	WHERE
/*18240*/ 		PerformedWorkId = @PerformedWorkId AND 
/*18241*/ 		ConcurrencyId = @ConcurrencyId
/*18242*/ 
/*18243*/ 	IF @@ROWCOUNT = 0
/*18244*/ 		BEGIN
/*18245*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*18246*/ 		RETURN
/*18247*/ 		END
/*18248*/ 	
/*18249*/ 	SELECT
/*18250*/ 		@NewConcurrencyId = ConcurrencyId,
/*18251*/ 		@NewUTCDate = UTCDateModified
/*18252*/ 	FROM [dbo].[WOPerformedWork]
/*18253*/ 	WHERE 
/*18254*/ 		PerformedWorkId = @PerformedWorkId
/*18255*/ 
/*18256*/ END
/*18257*/ GO
/*18258*/ SET ANSI_NULLS ON
/*18259*/ GO
/*18260*/ SET QUOTED_IDENTIFIER ON
/*18261*/ GO
/*18262*/ 
-- ===== updateWOReason (database/FLT_Schema.sql:18263-18304) =====
/*18263*/ CREATE PROCEDURE [dbo].[updateWOReason]
/*18264*/ 	@WOReasonId int,
/*18265*/ 	@WorkOrderId Int,
/*18266*/ 	@ReasonLine nvarchar(2048),
/*18267*/ 	@StampUserName nvarchar(20), 
/*18268*/ 	@ConcurrencyId bigint,
/*18269*/ 	@NewConcurrencyId bigint OUTPUT,
/*18270*/ 	@NewUTCDate datetime OUTPUT
/*18271*/ AS
/*18272*/ BEGIN
/*18273*/ 	SET NOCOUNT ON
/*18274*/ 
/*18275*/ 	UPDATE [dbo].[WOReason]
/*18276*/ 	SET
/*18277*/ 		WorkOrderId = @WorkOrderId, 
/*18278*/ 		ReasonLine = @ReasonLine, 
/*18279*/ 		UTCDateModified = GetUTCDate(), 
/*18280*/ 		StampUserName = @StampUserName 
/*18281*/ 	WHERE
/*18282*/ 		WOReasonId = @WOReasonId AND 
/*18283*/ 		ConcurrencyId = @ConcurrencyId
/*18284*/ 
/*18285*/ 	IF @@ROWCOUNT = 0
/*18286*/ 		BEGIN
/*18287*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*18288*/ 		RETURN
/*18289*/ 		END
/*18290*/ 	
/*18291*/ 	SELECT
/*18292*/ 		@NewConcurrencyId = ConcurrencyId,
/*18293*/ 		@NewUTCDate = UTCDateModified
/*18294*/ 	FROM [dbo].[WOReason]
/*18295*/ 	WHERE 
/*18296*/ 		WOReasonId = @WOReasonId
/*18297*/ 
/*18298*/ END
/*18299*/ GO
/*18300*/ SET ANSI_NULLS ON
/*18301*/ GO
/*18302*/ SET QUOTED_IDENTIFIER ON
/*18303*/ GO
/*18304*/ 
-- ===== updateWorkOrder (database/FLT_Schema.sql:18305-18388) =====
/*18305*/ CREATE PROCEDURE [dbo].[updateWorkOrder]
/*18306*/ 	@WorkOrderId int,
/*18307*/ 	@ProgId INT,
/*18308*/ 	@AircraftId Int,
/*18309*/ 	@LocationId Int,
/*18310*/ 	@WorkOrderTypeId Int,
/*18311*/ 	@WorkOrderStatusId INT,
/*18312*/ 	@EngineerId INT,
/*18313*/ 	@EngineeringActionId Int,
/*18314*/ 	@MechanicId Int,
/*18315*/ 	@RequestDate varchar(10),
/*18316*/ 	@FaultOccurredDate VARCHAR(10),
/*18317*/ 	@FaultOccurredMeter DECIMAL(8,1),
/*18318*/ 	@FISComplaintNbr nvarchar(8),
/*18319*/ 	@SquawkNbr nvarchar(20),
/*18320*/ 	@DueDate varchar(10),
/*18321*/ 	@DueTime varchar(8),
/*18322*/ 	@MeterStartWork DECIMAL(8,1),
/*18323*/ 	@FinishDate varchar(10),
/*18324*/ 	@FinishTime varchar(8),
/*18325*/ 	@MeterEndWork DECIMAL(8,1) = 0,
/*18326*/ 	@AircraftDispostion nvarchar(50),
/*18327*/ 	@AircraftIssueAlert BIT,
/*18328*/ 	@MaintenanceIssueAlert BIT,
/*18329*/ 	@IsDeleted bit, 
/*18330*/ 	@StampUserName nvarchar(20), 
/*18331*/ 	@ConcurrencyId bigint,
/*18332*/ 	@NewConcurrencyId bigint OUTPUT,
/*18333*/ 	@NewUTCDate datetime OUTPUT
/*18334*/ AS
/*18335*/ BEGIN
/*18336*/ 	SET NOCOUNT ON
/*18337*/ 
/*18338*/ 	UPDATE [dbo].[WorkOrder]
/*18339*/ 	SET
/*18340*/ 		AircraftId = @AircraftId, 
/*18341*/ 		ProgId = @ProgId,
/*18342*/ 		LocationId = @LocationId, 
/*18343*/ 		WorkOrderStatusID = @WorkOrderStatusId, 
/*18344*/ 		WorkOrderTypeId = @WorkOrderTypeId, 
/*18345*/ 		EngineerId = @EngineerId,
/*18346*/ 		EngineeringActionId = @EngineeringActionId,
/*18347*/ 		MechanicId = @MechanicId, 
/*18348*/ 		RequestDate = @RequestDate, 
/*18349*/ 		FISComplaintNbr = @FISComplaintNbr, 
/*18350*/ 		SquawkNbr = @SquawkNbr, 
/*18351*/ 		FaultOccurredDate = @FaultOccurredDate, 
/*18352*/ 		FaultOccurredMeter = @FaultOccurredMeter, 
/*18353*/ 		DueDate = @DueDate, 
/*18354*/ 		DueTime = @DueTime, 
/*18355*/ 		MeterStartWork = @MeterStartWork, 
/*18356*/ 		FinishDate = @FinishDate, 
/*18357*/ 		FinishTime = @FinishTime, 
/*18358*/ 		MeterEndWork = @MeterEndWork, 
/*18359*/ 		AircraftDispostion = @AircraftDispostion, 
/*18360*/ 		AircraftIssueAlert = @AircraftIssueAlert,
/*18361*/ 		MaintenanceIssueAlert = @MaintenanceIssueAlert,
/*18362*/ 		IsDeleted = @IsDeleted, 
/*18363*/ 		UTCDateModified = GetUTCDate(), 
/*18364*/ 		StampUserName = @StampUserName 
/*18365*/ 	WHERE
/*18366*/ 		WorkOrderId = @WorkOrderId AND 
/*18367*/ 		ConcurrencyId = @ConcurrencyId
/*18368*/ 
/*18369*/ 	IF @@ROWCOUNT = 0
/*18370*/ 		BEGIN
/*18371*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*18372*/ 		RETURN
/*18373*/ 		END
/*18374*/ 	
/*18375*/ 	SELECT
/*18376*/ 		@NewConcurrencyId = ConcurrencyId,
/*18377*/ 		@NewUTCDate = UTCDateModified
/*18378*/ 	FROM [dbo].[WorkOrder]
/*18379*/ 	WHERE 
/*18380*/ 		WorkOrderId = @WorkOrderId
/*18381*/ 
/*18382*/ END
/*18383*/ GO
/*18384*/ SET ANSI_NULLS ON
/*18385*/ GO
/*18386*/ SET QUOTED_IDENTIFIER ON
/*18387*/ GO
/*18388*/ 
-- ===== updateWorkOrderPart (database/FLT_Schema.sql:18389-18444) =====
/*18389*/ CREATE PROCEDURE [dbo].[updateWorkOrderPart]
/*18390*/ 	@WorkOrderPartId int,
/*18391*/ 	@WorkOrderId Int,
/*18392*/ 	@PartName nvarchar(20),
/*18393*/ 	@PartDescription nvarchar(255),
/*18394*/ 	@FisIDRemoved nvarchar(20),
/*18395*/ 	@PartNbrFailed Int,
/*18396*/ 	@FisIDAdded nvarchar(20),
/*18397*/ 	@PartModule nvarchar(20),
/*18398*/ 	@PartNbrRemoved Int,
/*18399*/ 	@PartNbrAdded Int,
/*18400*/ 	@StampUserName nvarchar(20), 
/*18401*/ 	@ConcurrencyId bigint,
/*18402*/ 	@NewConcurrencyId bigint OUTPUT,
/*18403*/ 	@NewUTCDate datetime OUTPUT
/*18404*/ AS
/*18405*/ BEGIN
/*18406*/ 	SET NOCOUNT ON
/*18407*/ 
/*18408*/ 	UPDATE [dbo].[WorkOrderPart]
/*18409*/ 	SET
/*18410*/ 		WorkOrderId = @WorkOrderId, 
/*18411*/ 		PartName = @PartName, 
/*18412*/ 		PartDescription = @PartDescription, 
/*18413*/ 		FisIDRemoved = @FisIDRemoved, 
/*18414*/ 		PartNbrFailed = @PartNbrFailed, 
/*18415*/ 		FisIDAdded = @FisIDAdded, 
/*18416*/ 		PartModule = @PartModule, 
/*18417*/ 		PartNbrRemoved = @PartNbrRemoved, 
/*18418*/ 		PartNbrAdded = @PartNbrAdded, 
/*18419*/ 		UTCDateModified = GetUTCDate(), 
/*18420*/ 		StampUserName = @StampUserName 
/*18421*/ 	WHERE
/*18422*/ 		WorkOrderPartId = @WorkOrderPartId AND 
/*18423*/ 		ConcurrencyId = @ConcurrencyId
/*18424*/ 
/*18425*/ 	IF @@ROWCOUNT = 0
/*18426*/ 		BEGIN
/*18427*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*18428*/ 		RETURN
/*18429*/ 		END
/*18430*/ 	
/*18431*/ 	SELECT
/*18432*/ 		@NewConcurrencyId = ConcurrencyId,
/*18433*/ 		@NewUTCDate = UTCDateModified
/*18434*/ 	FROM [dbo].[WorkOrderPart]
/*18435*/ 	WHERE 
/*18436*/ 		WorkOrderPartId = @WorkOrderPartId
/*18437*/ 
/*18438*/ END
/*18439*/ GO
/*18440*/ SET ANSI_NULLS ON
/*18441*/ GO
/*18442*/ SET QUOTED_IDENTIFIER ON
/*18443*/ GO
/*18444*/ 
-- ===== updateWOMechanicComment (database/FLT_Schema.sql:18568-18617) =====
/*18568*/ CREATE PROCEDURE [dbo].[updateWOMechanicComment]
/*18569*/ 	@WOMechanicCommentsId int,
/*18570*/ 	@WorkOrderId Int,
/*18571*/ 	@ComponentId INT,
/*18572*/ 	@CommentDate DATETIME,
/*18573*/ 	@IssueCodeId INT,
/*18574*/ 	@CommentRating SMALLINT,
/*18575*/ 	@Comments nvarchar(2048),
/*18576*/ 	@StampUserName nvarchar(20), 
/*18577*/ 	@ConcurrencyId bigint,
/*18578*/ 	@NewConcurrencyId bigint OUTPUT,
/*18579*/ 	@NewUTCDate datetime OUTPUT
/*18580*/ AS
/*18581*/ BEGIN
/*18582*/ 	SET NOCOUNT ON
/*18583*/ 
/*18584*/ 	UPDATE [dbo].[WOMechanicComment]
/*18585*/ 	SET
/*18586*/ 		WorkOrderId = @WorkOrderId, 
/*18587*/ 		ComponentId = @ComponentId,
/*18588*/ 		CommentDate = @CommentDate,
/*18589*/ 		IssueCodeId = @IssueCodeId,
/*18590*/ 		CommentRating = @CommentRating,
/*18591*/ 		Comments = @Comments, 
/*18592*/ 		UTCDateModified = GetUTCDate(), 
/*18593*/ 		StampUserName = @StampUserName 
/*18594*/ 	WHERE
/*18595*/ 		WOMechanicCommentsId = @WOMechanicCommentsId AND 
/*18596*/ 		ConcurrencyId = @ConcurrencyId
/*18597*/ 
/*18598*/ 	IF @@ROWCOUNT = 0
/*18599*/ 		BEGIN
/*18600*/ 		RAISERROR('Row has been edited by another user', 16, 1)
/*18601*/ 		RETURN
/*18602*/ 		END
/*18603*/ 	
/*18604*/ 	SELECT
/*18605*/ 		@NewConcurrencyId = ConcurrencyId,
/*18606*/ 		@NewUTCDate = UTCDateModified
/*18607*/ 	FROM [dbo].[WOMechanicComment]
/*18608*/ 	WHERE 
/*18609*/ 		WOMechanicCommentsId = @WOMechanicCommentsId
/*18610*/ 
/*18611*/ END
/*18612*/ GO
/*18613*/ USE [master]
/*18614*/ GO
/*18615*/ ALTER DATABASE [FLT] SET  READ_WRITE 
/*18616*/ GO
/*18617*/ 
