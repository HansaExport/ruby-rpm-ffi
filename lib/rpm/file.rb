
module RPM

  class File

    # @return [String] file path
    attr_accessor :path
    # @return [String] md5sum as string
    attr_accessor :md5sum
    # @return [String] Path to the destination if the file is a symbolic link
    # @note
    #   This path is sometimes relative. To convert an absolute path from relative path:
    #   File.expand_path (file.link_to, File.dirname (file.path))
    attr_accessor :link_to
    # @return [Number] File size
    attr_accessor :size
    # @return [Time] File modification time.
    attr_accessor :mtime
    # @return [String] File owner. Nil may be returned.
    attr_accessor :owner
    # @return [String] Group that owns the file. Nil may be returned.
    attr_accessor :group
    # @return [Number] Device type of the file
    attr_accessor :mode

    attr_accessor :attr
    attr_accessor :state

    # @return [Boolean] True if the file is a symbolic link
    def symlink?
      ! @link_to.nil?
    end

    # @return [Boolean] True if the file is marked as a configuration file
    def config?
      ! (@attr & FileAttrs[:config]).zero?
    end

    # @return [Boolean] True if the file is marked as documentation
    def doc?
      ! (@attr & FileAttrs[:doc]).zero?
    end

    # @return [Boolean] True if the file is marked as do not use
    def donotuse?
      ! (@attr & FileAttrs[:donotuse]).zero?
    end

    # @return [Boolean] True if the file is marked that can be missing on disk
    #
    # This modifier is used for files or links that are created during the %post scripts
    # but will need to be removed if the package is removed
    def is_missingok?
      ! (@attr & FileAttrs[:missingok]).zero?
    end

    # @return [Boolean] True if the file is marked as configuration not to be replaced
    #
    # This flag is used to protect local modifications.
    # If used, the file will not overwrite an existing file that has been modified.
    # If the file has not been modified on disk, the rpm command will overwrite the file. But,
    #   if the file has been modified on disk, the rpm command will copy the new file with an extra
    #   file-name extension of .rpmnew.
    def is_noreplace?
      ! (@attr & FileAttrs[:noreplace]).zero?
    end

    # @return [Boolean] True if the file is marked as a spec file
    def is_specfile?
      ! (@attr & FileAttrs[:specfile]).zero?
    end

    # @return [Boolean] True if the file is marked as ghost
    #
    # This flag indicates the file should not be included in the package.
    # It can be used to name the needed attributes for a file that the program, when installed,
    #   will create.
    # For example, you may want to ensure that a program’s log file has certain attributes.
    def ghost?
      ! (@attr & FileAttrs[:ghost]).zero?
    end

    # @return [Boolean] True if the file is a license
    def license?
      ! (@attr & FileAttrs[:license]).zero?
    end

    # @return [Boolean] True if the file is a README
    def readme?
      ! (@attr & FileAttrs[:readme]).zero?
    end

    # @return [Boolean] True if the file is listed in the exlude section
    def exclude?
      ! (@attr & FileAttrs[:exclude]).zero?
    end

    # @return [Boolean] True if the file is replaced during installation
    def replaced?
      ! (@attr & FileState[:replaced]).zero?
    end

    # @return [Boolean] True if the file is not installed
    def notinstalled?
      ! (@attr & FileState[:notinstalled]).zero?
    end

    # @return [Boolean] True if the file is shared over the network
    def netshared?
      ! (@attr & FileState[:netshared]).zero?
    end

    def initialize(path, md5sum, link_to, size, mtime, owner, group, rdev, mode, attr, state)
      @path = path
      @md5sum = md5sum
      @link_to = link_to
      @size = size
      @mtime = mtime
      @owner = owner
      @group = group
      @rdev = rdev
      @mode = mode
      @attr = attr
      @state = state
    end

    
  
end
end
