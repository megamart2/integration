/* code from summit.mc */


struct physid_mask
{
        unsigned long mask[(((256)+32 -1)/32)];
};
                                                                                                                                             
typedef struct physid_mask physid_mask_t;
                                                                                                                                             

static inline __attribute__((always_inline)) physid_mask_t ioapic_phys_id_map(physid_mask_t phys_id_map)
{
                                                                                                                                             
        return ({ physid_mask_t __physid_mask = { {[0 ... (((256)+32 -1)/32)-1] = 0UL} }; __physid_mask.mask[0] = 0x0F; __physid_mask; });
}
                                                                                                                                             
static inline __attribute__((always_inline)) physid_mask_t apicid_to_cpu_present(int apicid)
{
        return ({ physid_mask_t __physid_mask = { {[0 ... (((256)+32 -1)/32)-1] = 0UL} }; set_bit(0, (__physid_mask).mask); __physid_mask; });
}

