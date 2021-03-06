
module RPM
  module C
    typedef :pointer, :header

    attach_function 'headerNew', [], :header
    attach_function 'headerFree', [:header], :header
    attach_function 'headerLink', [:header], :header
    # ..
    HEADERGET_DEFAULT   = [0,
                           HEADERGET_MINMEM = (1 << 0)].freeze
    HEADERGET_EXT       = (1 << 1)
    HEADERGET_RAW       = (1 << 2)
    HEADERGET_ALLOC     = (1 << 3)
    HEADERGET_ARGV      = (1 << 4)

    # ..
    attach_function 'headerGet', %i[header rpmTagVal pointer uint32], :int
    attach_function 'headerPut', %i[header pointer uint32], :int
    # ...
    attach_function 'headerFormat', %i[header string pointer], :pointer
    # ...
    attach_function 'headerNVR', %i[header pointer pointer pointer], :int
    # ...
    attach_function 'headerGetAsString', %i[header rpmTagVal], :string
    # ...
    attach_function 'headerPutString', %i[header rpmTagVal string], :int
    # ...
    attach_function 'headerPutUint32', %i[header rpmTagVal pointer rpm_count_t], :int
    # ...
    attach_function 'rpmReadPackageFile', %i[header FD_t string pointer], Rc
  end
end
