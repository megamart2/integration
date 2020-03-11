typedef unsigned char u8;

struct facs_descriptor {
        char signature[4];
                                                                                                                                             
        u8 S4bios_f:1;
         u8:7;
        u8 reserved1[3];
                                                                                                                                             
        u8 version;
        u8 reserved[31];
};
                                                                                                                                             
extern const u8 acpi_gbl_ns_properties[0x1E +1];

