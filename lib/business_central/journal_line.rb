##
# Provides access to the /journals/{Id}/journalLines API
#

module BusinessCentral
  class JournalLine < BusinessCentral::Base
    API_OBJECT_PARENT = "journals"
    API_OBJECT = "journalLines"

    def get(journal_id, journal_line_id=nil)
      get_child(journal_id, journal_line_id)
    end
  end
end
