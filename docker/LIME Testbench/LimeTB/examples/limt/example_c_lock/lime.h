#define LIME

#ifdef LIME
#define _LIME_create_obs(name) name ## _lime_create_obs()
#define _LIME_create_obs_inst(name, id) name ## _lime_create_obs_inst((unsigned long)id)
#define _LIME_free_obs(name) name ## _lime_free_obs()
#define _LIME_free_obs_inst(name, id) name ## _lime_free_obs_inst((unsigned long)id)
#else
#define _LIME_create_obs(name) ;
#define _LIME_create_obs_inst(name, id) ;
#define _LIME_free_obs(name) ;
#define _LIME_free_obs_inst(name, id) ;
#endif

