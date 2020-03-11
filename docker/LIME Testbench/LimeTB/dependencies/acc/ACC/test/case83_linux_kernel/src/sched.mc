static void task_running_tick(struct rq *rq, struct task_struct *p)
{
        if (!--p->time_slice) {
                dequeue_task(p, rq->active);
                set_tsk_need_resched(p);
                p->prio = effective_prio(p);
                p->time_slice = task_timeslice(p);
                p->first_time_slice = 0;
                                                                                                                                             
                if (!rq->expired_timestamp)
                        rq->expired_timestamp = jiffies;
                if (!((p)->prio <= (p)->static_prio - (((((p)->static_prio) - 100 - 20) + 20) * ((((((100 + 40))-100)) * 25 / 100)) / (40) -
20 * (((((100 + 40))-100)) * 25 / 100) / 40 + 2)) || expired_starving(rq)) {
                        enqueue_task(p, rq->expired);
                        if (p->static_prio < rq->best_expired_prio)
                                rq->best_expired_prio = p->static_prio;
                } else
                        enqueue_task(p, rq->active);
        } else {
# 3194 "kernel/sched.c"
                if (((p)->prio <= (p)->static_prio - (((((p)->static_prio) - 100 - 20) + 20) * ((((((100 + 40))-100)) * 25 / 100)) / (40) - 20 * (((((100 + 40))-100)) * 25 / 100) / 40 + 2)) && !((task_timeslice(p) -
                        p->time_slice) % ((10 * 250 / 1000 ? : 1) * (1 << ((((((((100 + 40))-100)) * 25 / 100) - ((((p)->sleep_avg) / (1000000000 / 250)) * (((((100 + 40))-100)) * 25 / 100) / ((100 * 250 / 1000) * (((((100 + 40))-100)) * 25 / 100)))) ? : 1) - 1)) * __cpus_weight(&(cpu_online_map), 32))) &&
                        (p->time_slice >= ((10 * 250 / 1000 ? : 1) * (1 << ((((((((100 + 40))-100)) * 25 / 100) - ((((p)->sleep_avg) / (1000000000 / 250)) * (((((100 + 40))-100)) * 25 / 100) / ((100 * 250 / 1000) * (((((100 + 40))-100)) * 25 / 100)))) ? : 1) - 1)) * __cpus_weight(&(cpu_online_map), 32))) &&
                        (p->array == rq->active)) {
                                                                                                                                             
                }
        }
out_unlock:
        __raw_spin_unlock(&(&rq->lock)->raw_lock);
}
