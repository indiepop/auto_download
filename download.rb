require "fileutils"
class Download
  # To change this template use File | Settings | File Templates.
  attr_accessor :old_files ,:newfiles

  def self.down choice
    FileUtils.cp(choice,".")
  end

  def compare
    @old_files= ["PacketTrap_MSP_Setup.exe","Quest_Foglight_NMS_Setup.exe"]
    @new_files= ["\\\\10.6.194.4\\docs\\PacketTrap\\Dev\\builds\\PerspectiveInstaller\\Latest BRANCH\\PacketTrap_MSP_Setup.exe",
                 "\\\\10.6.194.4\\docs\\PacketTrap\\Dev\\builds\\PerspectiveInstaller\\Latest BRANCH\\Quest_Foglight_NMS_Setup.exe"]
    news = @new_files
    olds = @old_files


  0.upto(1).each do |i|

     unless FileUtils.cmp news[i] ,olds[i]
         puts "Now ,downloading #{ news[i]}..."
          Download.down news[i]
         puts "Finished the #{i}"
     end
  end
  end
end


new_version=Download.new
new_version.compare
