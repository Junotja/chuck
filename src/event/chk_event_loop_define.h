#ifdef _CORE_

#define _chk_loop				 	 \
	 chk_timermgr  *timermgr;        \
     int32_t        notifyfds[2];    \
     chk_dlist      handles;         \
     int32_t        status;          \
     pid_t          threadid

#ifdef _LINUX
	struct chk_event_loop {
		_chk_loop;
		int32_t    tfd;
		int32_t    epfd;
		struct     epoll_event* events;
		int32_t    maxevents;
	};
#elif _MACH

	struct chk_event_loop{
		_chk_loop;
		int    tfd;		
		int32_t kfd;
		struct kevent* events;
		int    maxevents;
		//for timer
	   	struct kevent change;	
	};

#else
#	error "un support platform!"		
#endif

#endif