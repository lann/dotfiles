require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:BACK_TRACE_LIMIT] = 100

class H
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TagHelper
  include LinkHelper
rescue 
  nil
end
