module EnergioConstants
  extend ActiveSupport::Concern

  VALID_ENTITIES = [
    "LowVoltageSegment",
    "MediumVoltageSegment",
    "NotablePoint"
  ]
end