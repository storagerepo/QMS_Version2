package qms.dao;

import java.awt.Font;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.poi.hssf.record.formula.functions.Now;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import qms.controllers.AbstractITextPdfView;
import qms.model.ManagementReview;
import qms.model.ManagementReviewAttendee;
import qms.model.NonConformance;

public class ManagementReviewDAO extends AbstractITextPdfView {
	private static DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		ManagementReviewDAO.dataSource = dataSource;
	}

	public DataSource setDataSource() {
		return dataSource;
	}

	@SuppressWarnings("rawtypes")
	/**
	 * Excel Sheet Generation
	 */
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("PDF REPORT");
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<ManagementReview> managementReviews = (List<ManagementReview>) model
				.get("managementReviews");
		String[] fields = (String[]) model.get("fields");

		int memolist = fields.length;
		System.out.println(memolist);
		PdfPTable table = new PdfPTable(memolist + 1);
		float[] width = new float[memolist + 1];
		table.setWidthPercentage(100);
		int i = 1;
		// System.out.println("came inside report");
		table.addCell(createLabelCell("SNO"));
		width[0] = 1.0f;
		String value = (String) session.getAttribute("option");
		System.out.println("session option = " + value);
		if (value == "0") {
			for (String field : fields) {
				System.out.println("fiellds" + field);
				if (field.equals("management_review_date")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Management review date"));

				} else if (field.equals("attendee_list_with_titles")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Attendee list with titles"));
				}
			}

		} else if (value == "2") {
			for (String field : fields) {
				System.out.println("fiellds" + field);
				if (field.equals("responsibility")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Responsibility"));

				} else if (field.equals("action_due_date")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Action due date"));

				} else if (field.equals("completion_date")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Completion Date"));

				}
			}
		} else {
			for (String field : fields) {
				System.out.println("fiellds" + field);
				if (field.equals("review_id")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("ID"));

				}

				else if (field.equals("management_review_date")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Management review date"));

				} else if (field.equals("attendee_list_with_titles")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Attendee list with titles"));

				} else if (field.equals("next_management_review_by")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Next management review by"));

				} else if (field.equals("category")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("category"));

				} else if (field.equals("assessment")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Assessment"));

				} else if (field.equals("report_link")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Report Link"));

				} else if (field.equals("action_needed")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Action needed"));

				} else if (field.equals("action_detail")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Action detail"));

				} else if (field.equals("action_due_date")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Action due date"));

				} else if (field.equals("responsibility")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Responsibility"));

				} else if (field.equals("completion_date")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Completion Date"));

				} else if (field.equals("continuous_improvement_project")) {
					width[i] = 1.0f;
					i++;
					table.addCell(createLabelCell("Continuous improvement project"));

				}
			}
		}
		Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
		int currentDay = localCalendar.get(Calendar.DATE);
		int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
		int currentYear = localCalendar.get(Calendar.YEAR);
		System.out.println("day  =" + currentDay + "month = " + currentMonth
				+ "year = " + currentYear);
		String currentdate = currentDay + "/" + currentMonth + "/"
				+ currentYear;
		int j = 1;
		for (ManagementReview managementReview : managementReviews) {
			System.out.println("attendee title = "
					+ managementReview.getAttendee_list_with_titles());
			String sno = String.valueOf(j);
			table.addCell(createValueCell(sno));
			j++;
			if (value == "0") {
				for (String field : fields) {

					if (field.equals("management_review_date")) {
						table.addCell(createValueCell(managementReview
								.getManagement_review_date()));
					} else if (field.equals("attendee_list_with_titles")) {
						table.addCell(createValueCell(managementReview
								.getAttendee_list_with_titles()));
					}
				}
			}
			if (value == "2") {
				for (String field : fields) {
					if (field.equals("responsibility")) {
						table.addCell(createValueCell(managementReview
								.getResponsibility()));

					} else if (field.equals("action_due_date")) {
						table.addCell(createValueCell(managementReview
								.getAction_due_date()));

					} else if (field.equals("completion_date")) {
						table.addCell(createValueCell(managementReview
								.getCompletion_date()));

					}
				}

			} else {
				System.out.println("else condition");
				for (String field : fields) {
					System.out.println("for condition");
					if (field.equals("review_id")) {
						table.addCell(createValueCell(managementReview
								.getReview_id()));
					}

					else if (field.equals("management_review_date")) {
						table.addCell(createValueCell(managementReview
								.getManagement_review_date()));
					} else if (field.equals("attendee_list_with_titles")) {
						table.addCell(createValueCell(managementReview
								.getAttendee_list_with_titles()));
					} else if (field.equals("next_management_review_by")) {
						table.addCell(createValueCell(managementReview
								.getNext_management_review_by()));
					} else if (field.equals("category")) {
						table.addCell(createValueCell(managementReview
								.getCategory()));
					} else if (field.equals("assessment")) {
						table.addCell(createValueCell(managementReview
								.getAssessment()));
					} else if (field.equals("report_link")) {
						table.addCell(createValueCell(managementReview
								.getReport_link()));
					} else if (field.equals("action_needed")) {
						table.addCell(createValueCell(managementReview
								.getAction_needed()));
					} else if (field.equals("action_detail")) {
						table.addCell(createValueCell(managementReview
								.getAction_detail()));
					} else if (field.equals("action_due_date")) {
						table.addCell(createValueCell(managementReview
								.getAction_due_date()));
					} else if (field.equals("responsibility")) {
						table.addCell(createValueCell(managementReview
								.getResponsibility()));
						i++;
					} else if (field.equals("completion_date")) {
						table.addCell(createValueCell(managementReview
								.getCompletion_date()));
					} else if (field.equals("continuous_improvement_project")) {

						if (managementReview
								.getContinuous_improvement_project().equals(
										"Yes"))
							table.addCell(createValueCell("Yes"));
						else
							table.addCell(createValueCell("No"));
						i++;
					}

				}
			}

		}
		table.setWidths(width);

		doc.add(table);
	}

	// creating header records
	public void setExcelHeader(HSSFSheet excelSheet, CellStyle style,
			String[] fields, HttpSession session) {
		HSSFRow excelHeader = excelSheet.createRow(0);
		// String[]
		// fields={"document_id","document_title","document_type","media_type","location","process","external","issuer","revision_level","date","approver1","approver2","approver3","status","comments"};
		int i = 0;
		String value = (String) session.getAttribute("option");
		System.out.println("session option = " + value);
		if (value == "0") {
			for (String field : fields) {
				if (field.equals("management_review_date")) {
					excelHeader.createCell(i).setCellValue(
							"Management review date");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("attendee_list_with_titles")) {
					excelHeader.createCell(i).setCellValue(
							"Attendee list with titles");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}
			}
		} else if (value == "2") {
			for (String field : fields) {
				if (field.equals("responsibility")) {
					excelHeader.createCell(i).setCellValue("Responsibility");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("action_due_date")) {
					excelHeader.createCell(i).setCellValue("Action due date");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("completion_date")) {
					excelHeader.createCell(i).setCellValue("Completion Date");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}
			}
		} else {
			for (String field : fields) {

				/*
				 * if(field.equals("review_id")) {
				 * excelHeader.createCell(i).setCellValue("review_id");
				 * excelHeader.getCell(i).setCellStyle(style); i++; } else
				 * if(field.equals("Date")) {
				 * excelHeader.createCell(i).setCellValue
				 * ("Report Created Date");
				 * excelHeader.getCell(i).setCellStyle(style); i++; } else
				 */if (field.equals("management_review_date")) {
					excelHeader.createCell(i).setCellValue(
							"Management review date");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("attendee_list_with_titles")) {
					excelHeader.createCell(i).setCellValue(
							"Attendee list with titles");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("next_management_review_by")) {
					excelHeader.createCell(i).setCellValue(
							"Next management review by");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("category")) {
					excelHeader.createCell(i).setCellValue("category");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("assessment")) {
					excelHeader.createCell(i).setCellValue("Assessment");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("report_link")) {
					excelHeader.createCell(i).setCellValue("Report Link");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("action_needed")) {
					excelHeader.createCell(i).setCellValue("Action needed");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("action_detail")) {
					excelHeader.createCell(i).setCellValue("Action detail");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("action_due_date")) {
					excelHeader.createCell(i).setCellValue("Action due date");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("responsibility")) {
					excelHeader.createCell(i).setCellValue("Responsibility");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("completion_date")) {
					excelHeader.createCell(i).setCellValue("Completion Date");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				} else if (field.equals("continuous_improvement_project")) {
					excelHeader.createCell(i).setCellValue(
							"Continuous improvement project");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}
			}
		}

	}

	// End

	// creating cell records
	public void setExcelRows(HSSFSheet excelSheet,
			List<ManagementReview> managementReviews, String[] fields,
			CellStyle style2, HttpSession session) {
		int record = 1;
		int i = 0;
		String value = (String) session.getAttribute("option");
		System.out.println("session option = " + value);
		Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
		int currentDay = localCalendar.get(Calendar.DATE);
		int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
		int currentYear = localCalendar.get(Calendar.YEAR);
		System.out.println("day  =" + currentDay + "month = " + currentMonth
				+ "year = " + currentYear);
		String currentdate = currentDay + "/" + currentMonth + "/"
				+ currentYear;
		for (ManagementReview managementReview : managementReviews) {
			HSSFRow excelRow = excelSheet.createRow(record++);
			// excelRow.setRowStyle((HSSFCellStyle) style2);
			i = 0;
			if (value == "0") {
				for (String field : fields) {
					if (field.equals("management_review_date")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getManagement_review_date());

						i++;
					} else if (field.equals("attendee_list_with_titles")) {
						excelRow.createCell(i)
								.setCellValue(
										managementReview
												.getAttendee_list_with_titles());
						i++;
					}
				}

			}
			if (value == "2") {
				for (String field : fields) {
					if (field.equals("responsibility")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getResponsibility());
						i++;
					} else if (field.equals("action_due_date")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getAction_due_date());
						i++;
					} else if (field.equals("completion_date")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getCompletion_date());
						i++;
					}
				}

			} else {

				for (String field : fields) {

					/*
					 * if(field.equals("review_id")) {
					 * excelRow.createCell(i).setCellValue(
					 * managementReview.getReview_id()); i++; } else
					 * if(field.equals("Date")) {
					 * excelRow.createCell(i).setCellValue( currentdate);
					 * 
					 * i++; } else
					 */if (field.equals("management_review_date")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getManagement_review_date());

						i++;
					} else if (field.equals("attendee_list_with_titles")) {
						excelRow.createCell(i)
								.setCellValue(
										managementReview
												.getAttendee_list_with_titles());
						i++;
					} else if (field.equals("next_management_review_by")) {
						excelRow.createCell(i)
								.setCellValue(
										managementReview
												.getNext_management_review_by());
						i++;
					} else if (field.equals("category")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getCategory());
						i++;
					} else if (field.equals("assessment")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getAssessment());
						i++;
					} else if (field.equals("report_link")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getReport_link());
						i++;
					} else if (field.equals("action_needed")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getAction_needed());
						i++;
					} else if (field.equals("action_detail")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getAction_detail());
						i++;
					} else if (field.equals("action_due_date")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getAction_due_date());
						i++;
					} else if (field.equals("responsibility")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getResponsibility());
						i++;
					} else if (field.equals("completion_date")) {
						excelRow.createCell(i).setCellValue(
								managementReview.getCompletion_date());
						i++;
					} else if (field.equals("continuous_improvement_project")) {

						if (managementReview
								.getContinuous_improvement_project().equals(
										"Yes"))
							excelRow.createCell(i).setCellValue("Yes");
						else
							excelRow.createCell(i).setCellValue("No");
						i++;
					}

				}
			}

		}
	}

	// to GET MAXIMUM REVIEW ID
	public int getMax_reviewid() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int Maxid = 1001;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select max(auto_id) as id from tbl_managementreviewmain";
			resultSet = statement.executeQuery(cmd_select);
			if (resultSet.next()) {
				if (!resultSet.getString("id").equals("null")) {
					Maxid = Integer.parseInt(resultSet.getString("id")) + 1;
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);

			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return Maxid;

	}

	// to INSERT INTO TABLE
	public boolean insert_managementreview(
			ManagementReview managementreviewdetails) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();

		}
		try {
			String cmd_insert = "insert into tbl_managementreviewmain(review_id,management_review_date,attendee_list_with_titles,job_title,next_management_review_by)  values('"
					+ managementreviewdetails.getReview_id()
					+ "','"
					+ managementreviewdetails.getManagement_review_date()
					+ "','"
					+ managementreviewdetails.getAttendee_list_with_titles()
					+ "','"
					+ managementreviewdetails.getJob_title()
					+ "','"
					+ managementreviewdetails.getNext_management_review_by()
					+ "')";
			String cmd_insert2 = "insert into tbl_managementreviewchild(review_id,category,assessment,report_link,action_needed,action_detail,action_due_date,responsibility,completion_date,continuous_improvement_project) values('"
					+ managementreviewdetails.getReview_id()
					+ "','"
					+ managementreviewdetails.getCategory()
					+ "','"
					+ managementreviewdetails.getAssessment()
					+ "','"
					+ managementreviewdetails.getReport_link()
					+ "','"
					+ managementreviewdetails.getAction_needed()
					+ "','"
					+ managementreviewdetails.getAction_detail()
					+ "','"
					+ managementreviewdetails.getAction_due_date()
					+ "','"
					+ managementreviewdetails.getResponsibility()
					+ "','"
					+ managementreviewdetails.getCompletion_date()
					+ "','"
					+ managementreviewdetails
							.getContinuous_improvement_project() + "')";
			System.out.println(statement.execute(cmd_insert));
			System.out.println(statement.execute(cmd_insert2));

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;
	}

	// to INSERT INTO TABLE
	public boolean insert_managementreviewattendee(String name, String job,
			String review_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();

		}
		try {
			String cmd_insert = "insert into tbl_managementreviewattendee(review_id,attendee_name,job_title)  values('"
					+ review_id + "','" + name + "','" + job + "')";

			System.out.println(statement.execute(cmd_insert));

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;
	}

	// to EDIT REVIEW
	public List<ManagementReviewAttendee> get_managementreviewattendee(String review_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		
		List<ManagementReviewAttendee> managementreviewdetails = new ArrayList<ManagementReviewAttendee>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery("select * from tbl_managementreviewattendee where review_id='"+review_id+"'");
			while (resultSet.next()) {
						managementreviewdetails.add(new ManagementReviewAttendee(resultSet
						.getString("id"), resultSet
						.getString("review_id"), resultSet
						.getString("attendee_name"),resultSet.getString("job_title")));
			}

    for (ManagementReviewAttendee attendee:managementreviewdetails){
    	
       System.out.println("Loop Id ::::" + attendee.getId());
    	
    }
			System.out.println();

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return managementreviewdetails;
	}

	// get attendee names and jobs by review id from managementreviewattendee
	// table
	public List<ManagementReview> edit_managementreview(String review_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		// boolean status = false;

		List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement
					.executeQuery("select * from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
							+ review_id + "'");
			while (resultSet.next()) {
				System.out
						.println(managementreviewdetails.add(new ManagementReview(
								resultSet.getString("review_id"),
								resultSet.getString("management_review_date"),
								resultSet
										.getString("attendee_list_with_titles"),
								resultSet.getString("job_title"),
								resultSet
										.getString("next_management_review_by"),
								resultSet.getString("category"),
								resultSet.getString("assessment"),
								resultSet.getString("report_link"),
								resultSet.getString("action_needed"),
								resultSet.getString("action_detail"),
								resultSet.getString("action_due_date"),
								resultSet.getString("responsibility"),
								resultSet.getString("completion_date"),
								resultSet
										.getString("continuous_improvement_project"))));
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return managementreviewdetails;
	}

	// To UPDATE TABLE
	public boolean update_managementreview(
			ManagementReview managementreviewdetails) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_update = "update tbl_managementreviewmain set management_review_date='"
					+ managementreviewdetails.getManagement_review_date()
					+ "',attendee_list_with_titles='"
					+ managementreviewdetails.getAttendee_list_with_titles()
					+ "',job_title='"
					+ managementreviewdetails.getJob_title()
					+ "',next_management_review_by='"
					+ managementreviewdetails.getNext_management_review_by()
					+ "' where review_id='"
					+ managementreviewdetails.getReview_id() + "'";
			statement.execute(cmd_update);
			String cmd_update2 = "update tbl_managementreviewchild set category='"
					+ managementreviewdetails.getCategory()
					+ "',assessment='"
					+ managementreviewdetails.getAssessment()
					+ "',report_link='"
					+ managementreviewdetails.getReport_link()
					+ "',action_needed='"
					+ managementreviewdetails.getAction_needed()
					+ "',action_detail='"
					+ managementreviewdetails.getAction_detail()
					+ "',action_due_date='"
					+ managementreviewdetails.getAction_due_date()
					+ "',responsibility='"
					+ managementreviewdetails.getResponsibility()
					+ "',completion_date='"
					+ managementreviewdetails.getCompletion_date()
					+ "',continuous_improvement_project='"
					+ managementreviewdetails
							.getContinuous_improvement_project()
					+ "' where review_id='"
					+ managementreviewdetails.getReview_id() + "'";
			statement.execute(cmd_update2);
			status = true;

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;

	}

	
	//update attendee table
	// To UPDATE TABLE
	public boolean update_managementreviewattendee(String name,String job,String id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_update = "update tbl_managementreviewattendee set attendee_name='"
					+ name
					+ "',job_title='"
					+ job
					+ "' where id='"
					+ id + "'";
			statement.execute(cmd_update);
			System.out.println(cmd_update);
			status = true;

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;

	}

	// for listing THE TABLE
	public List<ManagementReview> get_managementreview() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		// boolean status = false;
		List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {
			resultSet = statement
					.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id");
			while (resultSet.next()) {
				managementreviewdetails.add(new ManagementReview(resultSet
						.getString("review_id"), resultSet
						.getString("management_review_date"), resultSet
						.getString("attendee_list_with_titles"), resultSet
						.getString("job_title"), resultSet
						.getString("next_management_review_by"), resultSet
						.getString("category"), resultSet
						.getString("assessment"), resultSet
						.getString("report_link"), resultSet
						.getString("action_needed"), resultSet
						.getString("action_detail"), resultSet
						.getString("action_due_date"), resultSet
						.getString("responsibility"), resultSet
						.getString("completion_date"), resultSet
						.getString("continuous_improvement_project")));
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return managementreviewdetails;
	}

	// to SEARCH WITH ID....
	public List<ManagementReview> search_managementreviews(String review_id,
			String category, String management_review_date, int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		System.out.println(review_id);
		List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {

			if (page >= 1) {
				int offset = 5 * (page - 1);
				int limit = 5;
				if (!review_id.equals("") && !category.equals("")
						&& !management_review_date.equals("")) {
					resultSet = statement
							.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
									+ review_id
									+ "' and t2.category='"
									+ category
									+ "'and t1.management_review_date='"
									+ management_review_date
									+ "' limit "
									+ offset + "," + limit + "");
				} else if (!review_id.equals("") && !category.equals("")
						&& management_review_date.equals("")) {
					resultSet = statement
							.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
									+ review_id
									+ "' and t2.category='"
									+ category
									+ "' limit "
									+ offset
									+ ","
									+ limit + "");

				} else if (!review_id.equals("") && category.equals("")
						&& !management_review_date.equals("")) {
					resultSet = statement
							.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
									+ review_id
									+ "' and t1.management_review_date='"
									+ management_review_date
									+ "' limit "
									+ offset + "," + limit + "");

				} else if (review_id.equals("") && !category.equals("")
						&& !management_review_date.equals("")) {
					resultSet = statement
							.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t2.category='"
									+ category
									+ "' and t1.management_review_date='"
									+ management_review_date
									+ "' limit "
									+ offset + "," + limit + "");
				} else {
					resultSet = statement
							.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
									+ review_id
									+ "' or t2.category='"
									+ category
									+ "' or t1.management_review_date='"
									+ management_review_date
									+ "' limit "
									+ offset + "," + limit + "");
				}
			} else {
				if (!review_id.equals("") && !category.equals("")
						&& !management_review_date.equals("")) {
					resultSet = statement
							.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
									+ review_id
									+ "' and t2.category='"
									+ category
									+ "'and t1.management_review_date='"
									+ management_review_date + "'");
				} else if (!review_id.equals("") && !category.equals("")
						&& management_review_date.equals("")) {
					resultSet = statement
							.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
									+ review_id
									+ "' and t2.category='"
									+ category + "'");

				} else if (!review_id.equals("") && category.equals("")
						&& !management_review_date.equals("")) {
					resultSet = statement
							.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
									+ review_id
									+ "' and t1.management_review_date='"
									+ management_review_date + "'");

				} else if (review_id.equals("") && !category.equals("")
						&& !management_review_date.equals("")) {
					resultSet = statement
							.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t2.category='"
									+ category
									+ "' and t1.management_review_date='"
									+ management_review_date + "'");
				} else {
					resultSet = statement
							.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
									+ review_id
									+ "' or t2.category='"
									+ category
									+ "' or t1.management_review_date='"
									+ management_review_date + "'");
				}

			}
			while (resultSet.next()) {
				managementreviewdetails.add(new ManagementReview(resultSet
						.getString("review_id"), resultSet
						.getString("management_review_date"), resultSet
						.getString("attendee_list_with_titles"), resultSet
						.getString("job_title"), resultSet
						.getString("next_management_review_by"), resultSet
						.getString("category"), resultSet
						.getString("assessment"), resultSet
						.getString("report_link"), resultSet
						.getString("action_needed"), resultSet
						.getString("action_detail"), resultSet
						.getString("action_due_date"), resultSet
						.getString("responsibility"), resultSet
						.getString("completion_date"), resultSet
						.getString("continuous_improvement_project")));

			}
		} catch (Exception e) {

			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return managementreviewdetails;
	}

	// to SEARCH WITH ID....
	public List<ManagementReview> search_managementreviews(String review_id,
			String category, String management_review_date) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		System.out.println(review_id);
		List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {

			if (!review_id.equals("") && !category.equals("")
					&& !management_review_date.equals("")) {
				resultSet = statement
						.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
								+ review_id
								+ "' and t2.category='"
								+ category
								+ "'and t1.management_review_date='"
								+ management_review_date + "'");
			} else if (!review_id.equals("") && !category.equals("")
					&& management_review_date.equals("")) {
				resultSet = statement
						.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
								+ review_id
								+ "' and t2.category='"
								+ category
								+ "'");

			} else if (!review_id.equals("") && category.equals("")
					&& !management_review_date.equals("")) {
				resultSet = statement
						.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
								+ review_id
								+ "' and t1.management_review_date='"
								+ management_review_date + "'");

			} else if (review_id.equals("") && !category.equals("")
					&& !management_review_date.equals("")) {
				resultSet = statement
						.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t2.category='"
								+ category
								+ "' and t1.management_review_date='"
								+ management_review_date + "'");
			} else {
				resultSet = statement
						.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
								+ review_id
								+ "' or t2.category='"
								+ category
								+ "' or t1.management_review_date='"
								+ management_review_date + "'");
			}
			while (resultSet.next()) {
				managementreviewdetails.add(new ManagementReview(resultSet
						.getString("review_id"), resultSet
						.getString("management_review_date"), resultSet
						.getString("attendee_list_with_titles"), resultSet
						.getString("job_title"), resultSet
						.getString("next_management_review_by"), resultSet
						.getString("category"), resultSet
						.getString("assessment"), resultSet
						.getString("report_link"), resultSet
						.getString("action_needed"), resultSet
						.getString("action_detail"), resultSet
						.getString("action_due_date"), resultSet
						.getString("responsibility"), resultSet
						.getString("completion_date"), resultSet
						.getString("continuous_improvement_project")));

			}
		} catch (Exception e) {

			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return managementreviewdetails;
	}

	// to SEARCH WITH ID....
	public int Search_Managementreviews(String review_id, String category,
			String management_review_date) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords = 0;
		System.out.println(review_id);
		List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {

			if (!review_id.equals("") && !category.equals("")
					&& !management_review_date.equals("")) {
				resultSet = statement
						.executeQuery("select count(*) as noofrecords from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
								+ review_id
								+ "' and t2.category='"
								+ category
								+ "'and t1.management_review_date='"
								+ management_review_date + "'");
			} else if (!review_id.equals("") && !category.equals("")
					&& management_review_date.equals("")) {
				resultSet = statement
						.executeQuery("select count(*) as noofrecords from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
								+ review_id
								+ "' and t2.category='"
								+ category
								+ "'");

			} else if (!review_id.equals("") && category.equals("")
					&& !management_review_date.equals("")) {
				resultSet = statement
						.executeQuery("select count(*) as noofrecords from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
								+ review_id
								+ "' and t1.management_review_date='"
								+ management_review_date + "'");

			} else if (review_id.equals("") && !category.equals("")
					&& !management_review_date.equals("")) {
				resultSet = statement
						.executeQuery("select count(*) as noofrecords from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t2.category='"
								+ category
								+ "' and t1.management_review_date='"
								+ management_review_date + "'");
			} else {
				resultSet = statement
						.executeQuery("select count(*) as noofrecords from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"
								+ review_id
								+ "' or t2.category='"
								+ category
								+ "' or t1.management_review_date='"
								+ management_review_date + "'");
			}
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");

		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return noofRecords;

	}

	public List<ManagementReview> getlimitedmanagementreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();
		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
			cmd = "select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id limit "
					+ offset + "," + limit + "";

			// cmd =
			// "select * from tbl_narrativereport order by pname asc limit " +
			// offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				managementreviewdetails.add(new ManagementReview(resultSet
						.getString("review_id"), resultSet
						.getString("management_review_date"), resultSet
						.getString("attendee_list_with_titles"), resultSet
						.getString("job_title"), resultSet
						.getString("next_management_review_by"), resultSet
						.getString("category"), resultSet
						.getString("assessment"), resultSet
						.getString("report_link"), resultSet
						.getString("action_needed"), resultSet
						.getString("action_detail"), resultSet
						.getString("action_due_date"), resultSet
						.getString("responsibility"), resultSet
						.getString("completion_date"), resultSet
						.getString("continuous_improvement_project")));
			}
		} catch (Exception e) {
			/* logger.info(e.toString()); */
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return managementreviewdetails;

	}

	public int getnoofmanagementreport() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords = 0;

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();
		try {

			String cmd;

			cmd = "select count(*) as noofrecords from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id ";
			System.out.println("command" + cmd);
			resultSet = statement.executeQuery(cmd);
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");

		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return noofRecords;

	}

	// For REPORT GENERATION
	public List<ManagementReview> getmanagement_bytype(String type) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();

		Date date = new Date();
		String currentdate = "";
		String olddate = "";
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		System.out.println("Day of week = " + c.get(Calendar.DAY_OF_WEEK));
		System.out.println("first day of week = " + c.getFirstDayOfWeek());
		int i = c.get(Calendar.DAY_OF_WEEK);
		System.out.println("value 0f i = " + i);
		int currentDay = c.get(Calendar.DATE);
		int currentMonth = c.get(Calendar.MONTH) + 1;
		int currentYear = c.get(Calendar.YEAR);
		if (currentMonth < 10 && currentDay < 10)
			currentdate = currentYear + "-0" + currentMonth + "-0" + currentDay;

		else if (currentMonth < 10 && currentDay > 10)
			currentdate = currentYear + "-0" + currentMonth + "-" + currentDay;
		else if (currentMonth > 10 && currentDay < 10)
			currentdate = currentYear + "-" + currentMonth + "-0" + currentDay;
		else
			currentdate = currentYear + "-" + currentMonth + "-" + currentDay;

		Date start = c.getTime();
		c.add(Calendar.DATE, -13);
		Date end = c.getTime();
		System.out.println(start + " - " + end);
		int oldDay = c.get(Calendar.DATE);
		int oldMonth = c.get(Calendar.MONTH) + 1;
		int oldYear = c.get(Calendar.YEAR);

		if (oldMonth < 10 && oldDay < 10)
			olddate = oldYear + "-0" + oldMonth + "-0" + oldDay;

		else if (oldMonth < 10 && oldDay > 10)
			olddate = oldYear + "-0" + oldMonth + "-" + oldDay;
		else if (oldMonth > 10 && oldDay < 10)
			olddate = oldYear + "-" + oldMonth + "-0" + oldDay;
		else
			olddate = oldYear + "-" + oldMonth + "-" + oldDay;

		System.out.println(olddate);
		System.out.println(currentdate);

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_managementreview";

			if (type.equals("management_review_minutes"))
				cmd_select = "select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where ( t1.management_review_date ='"
						+ currentdate + "')";

			else if (type.equals("upcoming_management_review_memo")) {
				String s = "select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where ( t1.management_review_date BETWEEN '"
						+ olddate + "' AND '" + currentdate + "')";
				System.out.println(s);
				cmd_select = "select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where ( t1.management_review_date BETWEEN '"
						+ olddate + "' AND '" + currentdate + "')";
			} else if (type.equals("past_due_action_list")) {
				cmd_select = "select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where ( t2.action_due_date <='"
						+ currentdate + "') ";
			}

			else if (type.equals("list_of_continuous_improv_projects")) {
				cmd_select = "select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id";
			}
			System.out.println(cmd_select);
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				managementreviewdetails.add(new ManagementReview(resultSet
						.getString("review_id"), resultSet
						.getString("management_review_date"), resultSet
						.getString("attendee_list_with_titles"), resultSet
						.getString("job_title"), resultSet
						.getString("next_management_review_by"), resultSet
						.getString("category"), resultSet
						.getString("assessment"), resultSet
						.getString("report_link"), resultSet
						.getString("action_needed"), resultSet
						.getString("action_detail"), resultSet
						.getString("action_due_date"), resultSet
						.getString("responsibility"), resultSet
						.getString("completion_date"), resultSet
						.getString("continuous_improvement_project")));
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return managementreviewdetails;
	}

	public List<ManagementReview> getmanagement_bytype(String type,
			String startdate, String enddate) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();

		Date date = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		System.out.println("Day of week = " + c.get(Calendar.DAY_OF_WEEK));
		System.out.println("first day of week = " + c.getFirstDayOfWeek());
		int i = c.get(Calendar.DAY_OF_WEEK);
		System.out.println("value 0f i = " + i);
		int currentDay = c.get(Calendar.DATE);
		int currentMonth = c.get(Calendar.MONTH) + 1;
		int currentYear = c.get(Calendar.YEAR);
		String currentdate = currentYear + "-0" + currentMonth + "-0"
				+ currentDay;

		Date start = c.getTime();
		c.add(Calendar.DATE, -13);
		Date end = c.getTime();
		System.out.println(start + " - " + end);
		int oldDay = c.get(Calendar.DATE);
		int oldMonth = c.get(Calendar.MONTH) + 1;
		int oldYear = c.get(Calendar.YEAR);
		String olddate = oldYear + "-0" + oldMonth + "-" + oldDay;
		System.out.println(olddate);
		System.out.println(currentdate);

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_managementreview";

			if (type.equals("action_list_beween_dates")) {
				cmd_select = "select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where ( t1.management_review_date BETWEEN '"
						+ startdate + "' AND '" + enddate + "')";// doubts
			}

			System.out.println(cmd_select);
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				managementreviewdetails.add(new ManagementReview(resultSet
						.getString("review_id"), resultSet
						.getString("management_review_date"), resultSet
						.getString("attendee_list_with_titles"), resultSet
						.getString("job_title"), resultSet
						.getString("next_management_review_by"), resultSet
						.getString("category"), resultSet
						.getString("assessment"), resultSet
						.getString("report_link"), resultSet
						.getString("action_needed"), resultSet
						.getString("action_detail"), resultSet
						.getString("action_due_date"), resultSet
						.getString("responsibility"), resultSet
						.getString("completion_date"), resultSet
						.getString("continuous_improvement_project")));
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return managementreviewdetails;
	}

	// to DELETE SPECIFIC REVIEW
	public boolean delete_managementreview(String review_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_delete = "delete from tbl_managementreviewmain where review_id='"
					+ review_id + "'";
			statement.execute(cmd_delete);
			String cmd_delete2 = "delete from tbl_managementreviewchild where review_id='"
					+ review_id + "'";
			statement.execute(cmd_delete2);
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;

	}

	public void releaseConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
		}
	}

	public void releaseResultSet(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}

	public void releaseStatement(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
		}
	}
}
