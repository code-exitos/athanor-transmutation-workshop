# Data Objects — FLT

## Flight
Source: `FLTBizObjects/BusinessObject/Flight.vb:14`

| Field | Type | Note |
|---|---|---|
| FlightId | Integer |  |
| AircraftId | Integer |  |
| LocationId | Integer |  |
| SchedRouteId / SchedRouteName | Integer / String |  |
| FlownRouteId / FlownRouteName | Integer / String |  |
| FlightDate | String | varchar(10) in DB (database/FLT_Schema.sql:771) |
| FlightDateSort | String |  |
| WorkShiftIndicatorId / WorkShiftName | Integer / String |  |
| TakeoffWeight | Integer |  |
| AirframeWeightId / AirframeWeight / AirframeWeightUnit | Integer / Integer / String |  |
| Cargo1WeightId / Cargo1Weight / Cargo1WeightUnit | Integer / Integer / String |  |
| Cargo2WeightId / Cargo2Weight / Cargo2WeightUnit | Integer / Integer / String |  |
| BallastWeightId / BallastWeight / BallastWeightUnit | Integer / Integer / String |  |
| PilotId / PilotName | Integer / String |  |
| PreFlightFtiOK, PreFlightTelemetryOK, PreFlightTelemetryCheckComplete | Short |  |
| OilLevelIndicatorStart, HydraulicLevelIndicatorStart | Short |  |
| UsedMeterOffset | String | decimal(9,1) in DB |
| MeterUnitId | Integer |  |
| DepartureTime / ReturnTime | String | varchar(8) time-of-day; DB also holds *_Local and *_UTC datetimes |
| HobbsStart / HobbsEnd | String | decimal(9,1) in DB |
| EngineHoursStart / EngineHoursEnd | String | decimal(7,1) in DB |
| AirframeHoursStart / AirframeHoursEnd | String | decimal(9,1) in DB |
| AircraftEngineHoursCurrent | String |  |
| PostFlightFtiOK, PostFlightTelemetryCheckComplete, NacelleCheckBuildUp, Nacelle… | Short |  |
| IsApproved / ApprovedBy / UtcDateApproved | Boolean / String / Date |  |
| FlightGuid | Guid |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName | Date / Date / String |  |
| ConcurrencyId | String | SQL timestamp rendered as decimal string |
| LiquidFillList / FlightCommentList / FlightEngineRunList / FlightRegionTimeList | child collections |  |
| BrokenRules / ErrorsList / WarningsList | BrokenRulesList |  |

Used by: Flight is auto-approved on a validated save, Flight starting airframe hours = Hobbs start + meter offset, Flight departure/return times converted to UTC with overnight rollover, Time-of-day entry format, Overridable warnings versus hard errors, Overridable warnings must be acknowledged before save, Flight meter readings must run forward, and region time must add up to Hobbs us…, Flight start meters must continue from the aircraft's current meters, Flight duration and engine run sanity limits, Flight record required data and configurable pre/post-flight checks, Flight validation can be bypassed by caller, Takeoff weight defaults to sum of component weights, Flight log saved as one atomic unit with its child records, Duplicate flight entries are rejected, Optimistic concurrency on record updates, Flight approval state is recorded with approver and timestamp, Soft-delete and active filtering when loading flight and aircraft details, Meter, hour and liquid readings are rounded to fixed precision, Incremental flight export since a change date, Export meter and check-value conversions, Export UTC offset notation, Flight total hours and ending airframe hours from Hobbs meter, New flight starting meter values default from aircraft's current readings, One flight per aircraft, location, date and work shift, Approved flights lock meter readings; key fields editable only by super users o…, Flown route recorded as the scheduled route, Pending child-row entries are saved before the parent record; failure aborts th…, Parent save disabled while any child row is being edited, Deleting aircraft, flights and work orders, Duplicate flight entry check (aircraft + location + date + shift), Flight approval stamping (who approved and when), Flight record status flags and visibility, Flight usage hours per flight, Flight outlier detection by standard deviation, Flight data report: liquids per flight and record eligibility, Recalculate aircraft airframe and engine hours when an approved flight is added, New flight records start active, stamped and uniquely identified, Pilot list includes non-active pilots; pilots can be added inline, New versus existing record on save; pending child edits, Audit stamp of modifying user and UTC time

## FlightInfo
Source: `FLTBizObjects/BusinessObject/FlightInfo.vb:11`

| Field | Type | Note |
|---|---|---|
| FlightId | Integer |  |
| LocationId / LocationName | Integer / String |  |
| FlightDate / FlightDateSort | String |  |
| WorkShift | String |  |
| MSN / SerialNbr / RegistrationNbr | String |  |
| DepartureTime / ReturnTime | String |  |
| AirframeHoursStart / AirframeHoursEnd | String |  |
| FlightUsage | String |  |
| IsApproved / IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified | Date |  |

Used by: Flight log search filters and defaults, Default list filters show only active, non-deleted, approved records, List page default filters: active, not deleted, approved, Flight usage hours per flight, Flight record status flags and visibility, Deleting aircraft, flights and work orders

## FlightKeyInfo
Source: `FLTBizObjects/BusinessObject/FlightKeyInfo.vb:11`

| Field | Type | Note |
|---|---|---|
| FlightId / AircraftId / LocationId | Integer |  |
| FlightDateSort | String |  |
| WorkShiftId / WorkShift | Integer / String |  |
| MeterUnitId / MeterUnit | Integer / String |  |
| LocationName / MSN / SerialNbr / RegistrationNbr | String |  |
| AirframeHoursCurrent / AirframeHoursOffset | Decimal |  |
| ValidFlight / ValidAircraft / ValidLocation / ValidAircraftLocation / ValidWork… | Boolean |  |
| ErrorsList / WarningsList | BrokenRulesList |  |

Used by: Flight key selection must be complete and consistent, Duplicate flight entries are rejected, One flight per aircraft, location, date and work shift, New flight starting meter values default from aircraft's current readings, Flight start meters must continue from the aircraft's current meters

## FlightEngineRun
Source: `FLTBizObjects/BusinessObject/FlightEngineRun.vb:13`

| Field | Type | Note |
|---|---|---|
| FlightEngineRunId / FlightId | Integer |  |
| RunStartTime / RunEndTime | String | time-of-day text |
| EngineSpeed | String |  |
| FlightEngineRunGUID | Guid |  |
| IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Late-departure comments and engine runs roll to next day, Engine run must have valid start and end times in order and a non-zero speed, Flight duration and engine run sanity limits, Time-of-day entry format, Child rows are only added when at least one field is filled

## FlightComment
Source: `FLTBizObjects/BusinessObject/FlightComment.vb:15`

| Field | Type | Note |
|---|---|---|
| FlightCommentId / FlightId | Integer |  |
| ComponentId / ComponentName | Integer / String |  |
| CommentTime | String | varchar(8); DB also stores CommentDateTime_UTC |
| IssueCodeId / IssueCode | Integer / String |  |
| PilotComment | String |  |
| CommentRating | Short |  |
| FlightCommentGUID | Guid |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Late-departure comments and engine runs roll to next day, Comment rating scale and length limits, Comment rating scale 1 to 10, Evaluator comments carry component, issue code and rating, Time-of-day entry format

## FlightRegionTime
Source: `FLTBizObjects/BusinessObject/FlightRegionTime.vb:11`

| Field | Type | Note |
|---|---|---|
| FlightRegionTimeId / FlightId / RegionId | Integer |  |
| RegionCode | String |  |
| Hours | String |  |
| FlightRegionTimeGUID | Guid |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Flight meter readings must run forward, and region time must add up to Hobbs us…, Flight time split across operating regions

## LiquidFill
Source: `FLTBizObjects/BusinessObject/LiquidFill.vb:11`

| Field | Type | Note |
|---|---|---|
| LiquidFillId / FlightId | Integer |  |
| LiquidGroupId / LiquidGroupName | Integer / String |  |
| LiquidTypeId / LiquidTypeName | Integer / String |  |
| LiquidUnitId / LiquidUnitName | Integer / String |  |
| LiquidAmt | String |  |
| HobbsReading / AirframeHoursReading | String |  |
| LiquidFillLocation / LiquidFillApprover | String |  |
| LiquidFillGUID | Guid |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Liquid fill quantity limits by fluid and unit, Liquid fill record completeness and amount range, Liquid fill airframe-hours reading derived from Hobbs reading, Liquid fills recorded with Hobbs reading and approver, Meter, hour and liquid readings are rounded to fixed precision, Fuel/liquid usage per refill interval, Fuel burn running totals and average per aircraft, Flight data report: liquids per flight and record eligibility

## Aircraft
Source: `FLTBizObjects/BusinessObject/Aircraft.vb:11`

| Field | Type | Note |
|---|---|---|
| AircraftId / ProgId | Integer |  |
| CurrentLocationId / CurrentLocation | Integer / String |  |
| MSN / ShipNbr / SerialNbr / RegistrationNbr | String |  |
| ModelId / Model | Integer / String |  |
| Description / LiveryColor | String |  |
| EngineerId / MechanicId | Integer |  |
| AircraftStatusId / AircraftStatus | Integer / String |  |
| ManufacturerId | Integer |  |
| MeterUnitId / MeterUnit | Integer / String |  |
| AirframeHoursStart / AirframeHoursCurrent / AirframeHoursOffset | String |  |
| TotalRequiredUsage / CurrentFlightUsage | String |  |
| AircraftEngineHoursCurrent | String |  |
| EstEndOfTesting / ActEndOfTesting | String |  |
| AircraftGuid | Guid |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |
| AircraftConfigurationList / AircraftLocationList / GenericCommentList / TestLis… | child collections |  |
| BrokenRules / ErrorsList / WarningsList | BrokenRulesList |  |

Used by: New aircraft must have exactly one configuration and one location, Aircraft master data required fields and lengths, Latest configuration and latest location selection, Single current location per aircraft, Only aircraft comments can be added from the aircraft record, Aircraft test assignments are added only once, Aircraft save is atomic with its configurations and locations, Soft-delete and active filtering when loading flight and aircraft details, Aircraft current airframe hours shown net of the offset, Aircraft accumulated flight usage (Hobbs total), Aircraft current location follows latest 'last location' stay, Aircraft test-program record (status, hours, required usage, end of testing), Recalculate aircraft airframe and engine hours when an approved flight is added, Test assignment moves a test between assigned and unassigned lists, Deleting aircraft, flights and work orders, Optimistic concurrency on record updates

## AircraftInfo
Source: `FLTBizObjects/BusinessObject/AircraftInfo.vb:11`

| Field | Type | Note |
|---|---|---|
| AircraftId / CurrentLocationId | Integer |  |
| CurrentLocationName / ModelName / MSN / ShipNbr / SerialNbr / RegistrationNbr /… | String |  |
| AirframeHoursStart / AirframeHoursCurrent / AirframeHoursOffset | String |  |
| AirframeHoursUnitId | Integer |  |
| TotalRequiredUsage / CurrentUsage | String |  |
| EstEndOfTesting / ActEndOfTesting / AircraftStatus | String |  |
| AircraftEngineHoursCurrent | Decimal |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified | Date |  |

Used by: Aircraft search, filtering and paging, Default list filters show only active, non-deleted, approved records, List page default filters: active, not deleted, approved, Aircraft current airframe hours shown net of the offset

## AircraftConfiguration
Source: `FLTBizObjects/BusinessObject/AircraftConfiguration.vb:12`

| Field | Type | Note |
|---|---|---|
| AircraftConfigurationId / AircraftId | Integer |  |
| ConfigurationDescription | String |  |
| ConfigurationStartDate / ConfigurationEndDate | String |  |
| ConfigurationMeterStart / ConfigurationMeterEnd / ConfigurationMeterOffset | String |  |
| MeterUnitId / ModelId | Integer |  |
| EngineTypeId / EngineEmissionId / EngineMaturityId | Integer |  |
| EngineSerialNbr | String |  |
| APUTypeId / APUEmissionId / APUMaturityId | Integer |  |
| APUSerialNbr | String |  |
| NoseGear / MainGear / AvionicsVersion / EmissionLevel | String |  |
| PropellerTypeId | Integer |  |
| PropellerModelNbr / PropellerSerialNo | String |  |
| AircraftConfigurationGUID | Guid |  |
| IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Aircraft configuration meter chaining, Saved aircraft configurations are immutable, Latest configuration and latest location selection, Aircraft configuration period and component requirements, Aircraft configuration versioning and meter-start rules, New aircraft must have exactly one configuration and one location, Aircraft save is atomic with its configurations and locations

## AircraftLocation
Source: `FLTBizObjects/BusinessObject/AircraftLocation.vb:11`

| Field | Type | Note |
|---|---|---|
| AircraftLocationId / AircraftId / LocationId | Integer |  |
| SerialNbr / RegistrationNbr / MSN / ShipNbr / LocationName | String |  |
| ArrivalDate | String |  |
| RequiredUsage / AccumUsage | String |  |
| EstEndOfTest / ActEndOfTest | String |  |
| LastLocation | Boolean | current-location flag |
| AircraftLocationGUID | Guid |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Single current location per aircraft, Latest configuration and latest location selection, Aircraft location stay dates, Optional test-end and arrival dates are stored only when they are valid dates, Usage accumulated at a test location, Aircraft current location follows latest 'last location' stay, Export auto-creates missing aircraft-location assignments, Daily usage report: aircraft assigned to a location on a date, Location and program test-completion percentage, New aircraft must have exactly one configuration and one location

## AircraftComment
Source: `FLTBizObjects/BusinessObject/AircraftComment.vb:15`

| Field | Type | Note |
|---|---|---|
| AircraftCommentId / AircraftId / EngineerId | Integer |  |
| EngineerName | String |  |
| ComponentId / Component | Integer / String |  |
| CommentDate | String |  |
| CommentRating | Short |  |
| IssueCodeId / IssueCode | Integer / String |  |
| Comments | String |  |
| AircraftCommentGUID | Guid |  |
| IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Comment type validation and aircraft comment ordering, Comment rating scale and length limits, Comment rating scale 1 to 10, Only aircraft comments can be added from the aircraft record

## GenericComment
Source: `FLTBizObjects/BusinessObject/GenericComment.vb:15`

| Field | Type | Note |
|---|---|---|
| GenericCommentId | String |  |
| SourceTable / CommentType | String | discriminator across aircraft/flight/WO comments |
| SourceID / ParentId / AuthorID / ComponentId / IssueCodeId | Integer |  |
| AuthorName / ComponentName / IssueCode / Comments | String |  |
| CommentDate / CommentTime / CommentDateTime_UTC / CommentDateTime_Local | String |  |
| CommentRating | Short |  |
| CommentGUID | Guid |  |
| IsDeleted / IsDirty | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Comment type validation and aircraft comment ordering, Only aircraft comments can be added from the aircraft record, Comment rating scale and length limits

## WorkOrder
Source: `FLTBizObjects/BusinessObject/WorkOrder.vb:14`

| Field | Type | Note |
|---|---|---|
| WorkOrderId | Long |  |
| ProgId / AircraftId / LocationId | Integer |  |
| MSN / TailNbr / LocationName | String |  |
| WorkOrderStatusId / WorkOrderStatus | Integer / String |  |
| FaultOccurredDate / FaultOccurredMeter | String |  |
| FISComplaintNbr / SquawkNbr / WorkOrderNbr | String |  |
| RequestDate / DueDate / DueTime / FinishDate / FinishTime | String |  |
| AircraftIssueAlert / MaintIssueAlert | Boolean |  |
| WorkOrderTypeId / WorkOrderType | Integer / String |  |
| MeterStartWork / MeterEndWork | String |  |
| EngineerId / EngineerName | Integer / String |  |
| MechanicId / MechanicName | Long / String |  |
| EngineeringActionId / EngineeringAction | Integer / String |  |
| AircraftDispostion | String | spelling as in source |
| WorkOrderGuid | Guid |  |
| IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |
| WOReasonList, WOInstructionList, WOPerformedWorkList, WOPartList, WOEngineerCom… | child collections |  |
| NewWoReasonId, NewWoInstructionId, NewWoPerformedWorkId, NewWoPartId, NewWoEngi… | Integer | temporary-id counters for staged children |
| BrokenRules / ErrorsList / WarningsList | BrokenRulesList |  |

Used by: Insert vs update decision from concurrency token, Work order insert cascades child records, Work order child staging with temporary ids and deferred deletes, Child record validation rejects the change and shows errors on the parent, Work order document attachment rules, Work order mandatory header fields, Work order reference-number and disposition length limits, Work order date validity (request, due, finish), Due date and due time must be given together; time-of-day format, Fault and work meter readings and fault date normalization, Work order aggregate validation rolls up all child lines, Work order record lifecycle (new, edit, soft delete, concurrency), Work order status has no enforced transitions in the business object, Work order and all its child records are saved as one all-or-nothing unit, Optimistic concurrency: reject a save when someone else edited the record first, Work order header fields and status are recorded as supplied; no transition rul…, Meter readings stored as decimals and shown to one decimal place, Soft delete with audit stamp for work orders, their lines and master data, Opening a work order loads its lines with the default deleted-record filter, Work order aircraft and location fixed after creation, Work order status and completion data, Linking documents to work orders, Deleting aircraft, flights and work orders, Configurable business-rule switches

## WorkOrderInfo
Source: `FLTBizObjects/BusinessObject/WorkOrderInfo.vb:11`

| Field | Type | Note |
|---|---|---|
| WorkOrderId / AircraftId / LocationId | Long |  |
| MSN / ShipNbr / SerialNbr / RegistrationNbr / LocationName | String |  |
| WorkOrderNbr / FISComplaintNbr / SquawkNbr | String |  |
| RequestDate / DueDate / FinishDate | String |  |
| WorkOrderStatusId / WorkOrderStatus | Integer / String |  |
| IsActive / IsDeleted | Boolean |  |

Used by: Work order search filters, Work order delete via info list bypasses authorization, List page default filters: active, not deleted, approved

## WOReason / WOInstruction / WOPerformedWork (free-text WO lines)
Source: `FLTBizObjects/BusinessObject/WOReason.vb:13`

| Field | Type | Note |
|---|---|---|
| WOReasonId / WOInstructionsId / PerformedWorkId | Integer | WOInstruction.vb:14, WOPerformedWork.vb:13 |
| WorkOrderId | Integer |  |
| ReasonLine / InstructionLine / PerformedWorkLine | String |  |
| ReasonGUID / InstructionGUID / PerformedWorkGUID | Guid |  |
| IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Free-text work order lines (reason, instruction, performed work), Child lines must reference a parent work order, Child record insert-vs-update decided by presence of a version stamp; deletes o…, Work order child staging with temporary ids and deferred deletes, Soft delete with audit stamp for work orders, their lines and master data

## WOEngineerComment / WOMechanicComment
Source: `FLTBizObjects/BusinessObject/WOEngineerComment.vb:13`

| Field | Type | Note |
|---|---|---|
| EngineerCommentsId (Integer) / WOMechanicCommentsId (Long) | Integer / Long | WOMechanicComment.vb:13 |
| WorkOrderId | Integer |  |
| ComponentId / Component | Integer / String |  |
| CommentDate | String |  |
| CommentRating | Short |  |
| IssueCodeId / IssueCode | Integer / String |  |
| Comments | String |  |
| EngineerCommentGUID / MechanicCommentGUID | Guid |  |
| IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Engineer and mechanic comment content rules, Comment rating scale 1 to 10, Child lines must reference a parent work order, Child record insert-vs-update decided by presence of a version stamp; deletes o…

## WorkOrderPart
Source: `FLTBizObjects/BusinessObject/WorkOrderPart.vb:13`

| Field | Type | Note |
|---|---|---|
| WorkOrderPartId / WorkOrderId | Integer |  |
| PartName / PartModule | String | nvarchar(20) |
| PartDescription | String | nvarchar(255) |
| FisIDRemoved / FisIDAdded | String | nvarchar(20) |
| PartNbrFailed / PartNbrRemoved / PartNbrAdded | String | int in DB (database/FLT_Schema.sql:1317-1321); these are the quantity fields |
| IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Work order part identification and field lengths, Part quantities must be whole numbers 0-999, Child lines must reference a parent work order, Child record insert-vs-update decided by presence of a version stamp; deletes o…

## DocumentInfo
Source: `FLTBizObjects/BusinessObject/DocumentInfo.vb:11`

| Field | Type | Note |
|---|---|---|
| DocumentId | Long |  |
| ProgId / DocumentTypeId | Integer |  |
| FileExtension / MimeType | String |  |
| DocumentName | String | varchar(255) |
| DocumentDescription | String |  |
| DocumentSize | Integer |  |
| IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |
| BrokenRules / ErrorsList / WarningsList | BrokenRulesList |  |

Used by: Work order document attachment rules, Document upload acceptance, Linking documents to work orders, Linking documents to a work order without duplicates, Uploaded document must be present and no larger than 10 MB, Uploads are limited to file extensions registered as Document Types, Document upload stores metadata first, then file content, under the user's curr…, Document list is scoped to the current program, filtered by type and deleted st…, Document metadata edit, soft-delete flag and delete action, Overridable warnings on document edits (unwired), Document upload requirements for work orders

## Document (content table) / WorkOrderDocXref
Source: `database/FLT_Schema.sql:266`

| Field | Type | Note |
|---|---|---|
| DocumentId | int |  |
| DocumentContent | varbinary(max) |  |
| WorkOrderDocXref (FLT_Schema.sql:1292) | table | link WorkOrder <-> DocumentInfo |

Used by: Documents are stored in fixed-size chunks, Document download is streamed as an attachment in fixed-size chunks, Linking documents to a work order without duplicates, Linking documents to work orders

## DocumentType
Source: `FLTBizObjects/BusinessObject/DocumentType.vb:11`

| Field | Type | Note |
|---|---|---|
| DocumentTypeId | Integer |  |
| FileExtension | String |  |
| MimeType | String |  |
| ConcurrencyId | String |  |

Used by: Document Type definition: extension and MIME type, Uploads are limited to file extensions registered as Document Types, Document upload acceptance

## FltUser
Source: `FLTBizObjects/BusinessObject/FltUser.vb:12`

| Field | Type | Note |
|---|---|---|
| UserName | String |  |
| Password / PasswordSalt | String | hashed + per-user salt; values never reproduced |
| Email / PasswordQuestion / PasswordAnswer | String |  |
| IsSuperUser / IsApproved / IsLockedOut | Boolean |  |
| UtcLastLoginDate / UtcLastLockoutDate / UtcLastPasswordChangedDate | DateTime |  |
| FailedPasswordAttemptCount / FailedPasswordAnswerAttemptCount | Integer |  |
| UtcFailedPasswordAttemptWindowStart / UtcFailedPasswordAnswerAttemptWindowStart | DateTime |  |
| DisplayName / Location / CountryCode / PhoneNumber / MgrUserName / Department /… | String |  |
| DefaultProgId | Integer |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: User password lifecycle, Login account eligibility check, Failed-login lockout threshold, Lockout expiry and failure-counter reset, Password hashing with per-user salt, Random password generation, User account data rules and new-user defaults, Login lockout thresholds, User account dates before 1800 are treated as not set, Login credential and account-status check, Successful login records last-login time, User account maintenance overwrites security state, Create or edit a user account; new users get a generated password by email, Admin password reset generates and emails a new password, Unlock a locked-out user account, Self-service password change requires old password and matching confirmation, Self-service profile update limited to contact and organizational fields, Self-service password reset emails a new random password, Account lockout after repeated failed logins, Login authentication with a single generic failure message, Login failure and password recovery do not reveal which accounts exist

## FltIdentity (+ nested UserProgram, UserModulePermissions)
Source: `FLTBizObjects/BusinessObject/fltIdentity.vb:9`

| Field | Type | Note |
|---|---|---|
| IsLoggedIn | Boolean |  |
| UserName / UserDisplayName / ProgDisplayName / LastLoginDate | String |  |
| IsSuperUser | Boolean |  |
| CurrentProgId | Long |  |
| IsCurrentProgramManager | Boolean |  |
| UserProgramsList | Collection(Of UserProgram{ProgId, ProgName}) | fltIdentity.vb:24, untyped properties |
| CurrentModulePermissionsList | Collection(Of UserModulePermissions{ModuleName, CanView, Ca… | fltIdentity.vb:59; defaults False |

Used by: Module-based authorization for every business operation, Operations that bypass authorization, Role-based action authorization hierarchy, Business-object to security-module mapping, User session authorization context defaults to no access, User login returns identity, super-user flag, default program and accessible pr…, Switching the current program reloads permissions, Program access by super-user flag or role membership, Navigation menu shown by module permission and role, Fleet visibility requires Fleet CanView permission, Aircraft status editing requires Fleet CanEdit plus a role time window, Export access requires the Export/CanView permission (session reuse or batch re…, Unattended export must run as an authenticated, authorized FLT service user, Editing program reference data needs the matching module permission, Reports are scoped to the user's currently selected program, Report exports allow any user, Lookup tables readable without authorization

## FltRole / FltUserInRole
Source: `FLTBizObjects/BusinessObject/FltRole.vb:12`

| Field | Type | Note |
|---|---|---|
| ProgId / ProgName | Integer / String |  |
| RoleId | Long |  |
| RoleName / RoleDescription | String |  |
| IsProgramManager | Boolean |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |
| FltUserInRole (database/FLT_Schema.sql:248) | table | user-role membership |

Used by: Roles are scoped to a program and carry a program-manager flag; soft delete and…, Per-program manager role and per-module view/edit permissions, Assign or remove users and roles, Program access by super-user flag or role membership, Role edit time windows are configuration-driven

## FltRoleModulePermissions
Source: `FLTBizObjects/BusinessObject/FltRoleModulePermissions.vb:11`

| Field | Type | Note |
|---|---|---|
| RoleId | Integer |  |
| ModuleName | String |  |
| CanView / CanEdit | Boolean |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Role module permissions default to full access, Role-based module permissions (view/edit), Per-program manager role and per-module view/edit permissions, Module-based authorization for every business operation

## FltModule
Source: `FLTBizObjects/BusinessObject/FltModule.vb:12`

| Field | Type | Note |
|---|---|---|
| ModuleName | String | identity key |
| ModuleDescription | String |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Module registry maintenance (identity fixed, active/deleted lifecycle), Business-object to security-module mapping

## Program
Source: `FLTBizObjects/BusinessObject/Program.vb:11`

| Field | Type | Note |
|---|---|---|
| ProgID | Integer |  |
| ProgName / ProgDescription / ProgVersion | String |  |
| ProgramLogo / ReportLogo / YearLogo | String |  |
| ProgStatus | Byte |  |
| DateOpened / DateClosed | String |  |
| ActualValue | Decimal |  |
| ProjectCode / ActivityCode / DeptCode / CompanyName | String |  |
| NearEndUsage / AvgDailyUsage / WeeklyFlightDays | Integer |  |
| ProgramGuid | Guid |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Program cloning copies setup data, New program can be cloned from an active, non-deleted program, Program numeric parameters must be well-formed numbers, Program profile maintenance, including the usage planning figures, Program status cannot be changed from the Program Profile screen, Program-level forecasting parameters, Reference data (program, location, region, route) required fields, Location and program test-completion percentage

## Location
Source: `FLTBizObjects/BusinessObject/Location.vb:11`

| Field | Type | Note |
|---|---|---|
| LocactionId | Integer | misspelled in source |
| ProgId / TimeZoneId | Integer |  |
| TimeZoneCode | String |  |
| TimeZoneOffset / DaylightSavingOffset | Double |  |
| DaylightSavingTime | Boolean |  |
| DaylightSavingBegin / DaylightSavingEnd | String |  |
| LocationName | String |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Local-to-UTC conversion with location daylight-saving window, Location requirements, Locations belong to a test program, Reference data (program, location, region, route) required fields, Program reference data needs a logged-in user and is scoped to that user's curr…, Active and deleted status of reference records, and the default list filters, Delete marks reference records as deleted after the user confirms

## Route
Source: `FLTBizObjects/BusinessObject/Route.vb:11`

| Field | Type | Note |
|---|---|---|
| RouteId / LocationId / TimeZoneId | Integer |  |
| Name / Description / TimeZoneCode | String |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: A route must belong to an active location and have a time zone, The 'Only Deleted' filter on Routes and Weight Tracking returns non-deleted rec…, Reference data (program, location, region, route) required fields, Flown route recorded as the scheduled route

## Region
Source: `FLTBizObjects/BusinessObject/Region.vb:11`

| Field | Type | Note |
|---|---|---|
| Id / ProgId | Integer |  |
| Code / Name | String |  |
| IsActive | Boolean |  |
| ConcurrencyId | String |  |

Used by: Region code and name requirements, Reference data (program, location, region, route) required fields

## UTCTimeZone
Source: `FLTBizObjects/BusinessObject/UTCTimeZone.vb:11`

| Field | Type | Note |
|---|---|---|
| TimeZoneID | Integer |  |
| TimeZoneCode / TimeZoneDescr | String |  |
| TimeZoneOffset / DaylightSavingOffset | Double |  |
| DaylightSavingTime | Boolean |  |
| DaylightSavingBegin / DaylightSavingEnd | String |  |
| IsActive | Boolean |  |
| ConcurrencyId | String |  |

Used by: Time zone daylight-saving definition, Time zone definition with UTC offset and daylight-saving window, Daylight-saving begin/end dates are only stored when they are valid dates, Local-to-UTC conversion with location daylight-saving window

## WeightDef
Source: `FLTBizObjects/BusinessObject/WeightDef.vb:11`

| Field | Type | Note |
|---|---|---|
| WeightDefId / ProgId / WeightDefTypeId | Integer |  |
| WeightDefTypeDescr / WeightDefDescr | String |  |
| Weight | String | stored as whole number |
| WeightUnitId / WeightUnit | Integer / String |  |
| SortOrder | Integer |  |
| WeightDefGuid | Guid |  |
| IsActive / IsDeleted | Boolean |  |
| UtcDateCreated / UtcDateModified / StampUserName / ConcurrencyId | Date / Date / String / String |  |

Used by: Weight definition required fields and description charset, Weight definitions stored as whole numbers, Weight definitions are classified as Airframe, Cargo or Ballast (dollies), Takeoff weight defaults to sum of component weights, The 'Only Deleted' filter on Routes and Weight Tracking returns non-deleted rec…

## WeightDefType
Source: `FLTBizObjects/BusinessObject/WeightDefType.vb:11`

| Field | Type | Note |
|---|---|---|
| WeightDefTypeId | Integer |  |
| WeightDefTypeDescr | String |  |
| SortOrder | Integer |  |
| ConcurrencyId | String |  |

Used by: Weight tracking type description rule, Weight definition types carry a description and display sort order

## fltLookupBase
Source: `FLTBizObjects/BusinessObject/fltLookupBase.vb:11`

| Field | Type | Note |
|---|---|---|
| ID | Integer |  |
| LookupName | String | selects the lookup table |
| ProgId | Integer |  |
| StringValue | String |  |
| SortOrder | Integer |  |
| IsActive | Boolean |  |
| ConcurrencyId | String |  |

Used by: Fixed catalog of administrator-maintainable lookup (configuration value) types, Program-scoped lookup lists with active flag and sort order, Configuration lookup values per program and lookup type, Lookup tables readable without authorization, Config Values report exports active entries of one selected lookup type, Aircraft test assignments are added only once, Test assignment moves a test between assigned and unassigned lists

## BrokenRule
Source: `FLTBizObjects/BusinessObject/BrokenRule.vb:8`

| Field | Type | Note |
|---|---|---|
| RuleIdentifier | String |  |
| PropertyName | String |  |
| Message | String |  |
| OverRideableRule | Boolean | warning vs hard error |
| OverRideRule | Boolean | user acknowledged |

Used by: Overridable warnings versus hard errors, Overridable warnings must be acknowledged before save, Child record validation rejects the change and shows errors on the parent, Work order aggregate validation rolls up all child lines, Overridable warnings on document edits (unwired)

## AircraftStatus (FltFleet)
Source: `FltFleet/AircraftStatus.vb:9`

| Field | Type | Note |
|---|---|---|
| AircraftId / AircraftStatusId | Long | backed by Integer fields |
| LocationName / MSN | String |  |
| Status | Integer | 1=UP, 2=DOWN, else OFF TEST (StatusAsString, line 65) |
| EngineerComment / HangarComment | String | nvarchar(2048) |
| UTCDateModified | Date |  |
| DateModifiedInPT | String (read-only) |  |
| DB table AircraftStatus | table | database/FLT_Schema.sql:1069 |

Used by: Aircraft status code mapping (UP / DOWN / OFF TEST), Main fleet board hides OFF TEST aircraft; OFF TEST view shows the whole fleet, Last-update timestamp displayed in Pacific Time, Aircraft status update and its comments, Aircraft status record is created on first update and overwritten afterwards, Aircraft status editing requires Fleet CanEdit plus a role time window, Current Pacific Time derivation for edit window

## DownloadFile / DownloadFileList (export client)
Source: `FLTExportClient/FltExportManager.vb:13`

| Field | Type | Note |
|---|---|---|
| FileName | String |  |
| FileSize | Integer |  |
| UtcDateCreated | Date |  |

Used by: File list response validation and record mapping, Exactly one listed file must be selected before fetching, Downloaded export is saved to My Documents only when content is non-empty, Three-step export workflow: create, list, fetch, Fetch an export file only when the name matches exactly one file, Export files are kept for 24 hours, purged when the file list is viewed, Export file is built under a temporary name, then published with a UTC-timestam…

## Flight (Web API DTO)
Source: `FLTWebAPI/FltWebApi/Models/Flight.cs:11`

| Field | Type | Note |
|---|---|---|
| FlightId / AircraftId / LocationId / EvaluatorId | int |  |
| SchedRouteId / FlownRouteId | int |  |
| FlightDate | string |  |
| WorkShiftIndicatorId | int |  |
| AirframeId / Cargo1Id / Cargo2Id / BallastId | int |  |
| PreFlightFtiOK / PreFlightTelemetryOK / PreFlightTelemetryCheckComplete / OilLe… | short |  |
| DepartureTime / ReturnTime | string |  |
| EngineHoursStart / EngineHoursEnd / HobbsStart / HobbsEnd / UsedMeterOffset | decimal |  |
| MeterUnitId | int |  |
| PostFlightFtiOK / PostFlightTelemetryCheckComplete / NacelleCheckBuildUp / Nace… | short |  |
| FlightComments / EngineRuns / RegionTimes / LiquidFills | List<child DTO> | EngineRun{EngineRunId, EngineSpeed:int, RunStartTime, RunEndTime}; RegionTime{RegionTimeId, RegionId, Hours:decimal}; FlightComment{FlightCommentId, ComponentI… |

Used by: Newly logged flights start active, unapproved and not deleted, Flight upload is all-or-nothing with its child records, Flight read-back drops hydraulic level, work shift and meter offset, Flight airframe hours = Hobbs meter reading + meter offset, Flight load configuration: one airframe, up to two cargo items, one ballast, Pre-flight and post-flight checklist results recorded per flight, Flight records both scheduled and actually flown route, Liquid fills recorded with Hobbs reading and approver, Flight time split across operating regions, Evaluator comments carry component, issue code and rating, New flight records start active, stamped and uniquely identified, API callers must authenticate with Basic credentials or configured default acco…, Records are only returned within their program/location/aircraft scope

## Aircraft / FlightInfo (Web API read DTOs)
Source: `FLTWebAPI/FltWebApi/Models/Aircraft.cs:11`

| Field | Type | Note |
|---|---|---|
| AircraftId / CurrentLocationId / MeterUnitId | int |  |
| ModelName / MSN / RegistrationNbr / Description | string |  |
| AirframeHoursCurrent / AirframeHoursOffset | decimal |  |
| AircraftGUID | Guid |  |
| FlightInfo{FlightId, FlightGuid, FlightDate, AirframeHoursStart, AirframeHoursE… | DTO | FLTWebAPI/FltWebApi/Models/FlightInfo.cs:11 |

Used by: Aircraft current airframe hours shown net of the offset, Records are only returned within their program/location/aircraft scope, Empty result lists are reported as not found, Flight read-back drops hydraulic level, work shift and meter offset

## Airframe / Cargo / Ballast (Web API weight DTOs)
Source: `FLTWebAPI/FltWebApi/Models/Airframe.cs:11`

| Field | Type | Note |
|---|---|---|
| AirframeId / CargoId / BallastId | int | Cargo.cs:11, Ballast.cs:11 (collection named Dollies) |
| Description | string |  |
| Weight | string | free text, not numeric |
| WeightUnit | string |  |

Used by: Weight definitions are classified as Airframe, Cargo or Ballast (dollies), Weights are free-text with a separate unit (not validated as numbers), Flight load configuration: one airframe, up to two cargo items, one ballast, Empty result lists are reported as not found

## Program / Location / Region / Route / LookUpValue (Web API reference DTOs)
Source: `FLTWebAPI/FltWebApi/Models/LookUpValue.cs:11`

| Field | Type | Note |
|---|---|---|
| LookUpValue{ID:int, SortOrder:int, StringValue:string} | DTO |  |
| Program{ProgID:int, ProgName, ProgDescription, ProgVersion} | DTO | Program.cs:11 |
| Location{LocationId:int, ProgId:int, LocationName} | DTO | Location.cs:11 |
| Region{Id:int, Code, Name} | DTO | Region.cs:11 |
| Route{RouteId:int, Name, Description} | DTO | Route.cs:11 |

Used by: Lookup and program lists are not filtered by caller identity, Locations belong to a test program, Records are only returned within their program/location/aircraft scope, Empty result lists are reported as not found
