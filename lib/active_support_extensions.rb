
require 'active_support/time_with_zone'

# Personal preference, I like my JSON timestamps in UTC, and xmlschema
# format, eg "2010-12-13T18:00:00Z"
class ActiveSupport::TimeWithZone
  def to_json(options = nil)
    utc.xmlschema.to_json
  end
end

