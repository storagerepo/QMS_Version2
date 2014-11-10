package qms.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import qms.model.EmailSender;
import qms.model.Maintenance;



public class AutoMailSender {

	@Autowired
	EmailSender emailSender;

	@Autowired
	MaintenanceDAO maintenanceDAO;
	
	public void doWeeklyProcess()
	{
		emailSender.sendWeekly("krishnakanthdeemsys@gmail.com","rsureshbecse@gmail.com","Maintainence and Calibration Report",maintenanceDAO.getDetailsForWeekMail());
	}
	
	public void doMonthlyProcess()
	{
		emailSender.sendMonthly("krishnakanthdeemsys@gmail.com","rsureshbecse@gmail.com","Maintainence and Calibration Report",maintenanceDAO.getDetailsForMonthlyMail());
	}
}
