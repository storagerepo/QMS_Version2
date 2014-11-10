package qms.model;


import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;


import qms.model.Worker;

import qms.dao.AutoMailSender;
/**
 * Scheduler for handling jobs
 */
@Service
public class SchedulerService {

	protected static Logger logger = LoggerFactory.getLogger("service");

	@Autowired
	@Qualifier("syncWorker")
	private Worker worker;
	
	
	@Autowired
	AutoMailSender autoMailSender;

	/**
	 * You can opt for cron expression or fixedRate or fixedDelay
	 * <p>
	 * See Spring Framework 3 Reference:
	 * Chapter 25.5 Annotation Support for Scheduling and Asynchronous Execution
	 */
	//@Scheduled(fixedDelay=5000)
	//@Scheduled(fixedRate=5000)
	@Scheduled(cron="* 00 09 ? * MON")
	public void doScheduleEveryMonday() {
		logger.debug("Start scheduler");
	
			worker.work();
			try
			{
				
				autoMailSender.doWeeklyProcess();
 			
			}
			catch(Exception ex)
			{
				System.out.println(ex.toString());
			}
			
        /*}*/
		
		logger.debug("End scheduler");
	}
	//http://javahunter.wordpress.com/2011/05/05/cronscheduler-in-spring/
	@Scheduled(cron="0 00 08 1 * ?")
	public void doScheduleByFirstDayOfMonth() {
		logger.debug("Start scheduler");
	
			worker.work();
			try
			{
				
				autoMailSender.doMonthlyProcess();
 			
			}
			catch(Exception ex)
			{
				System.out.println(ex.toString());
			}
			
        /*}*/
		
		logger.debug("End scheduler");
	}
	
	

}
