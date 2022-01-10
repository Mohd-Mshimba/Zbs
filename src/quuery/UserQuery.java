package quuery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import LoginDao.DBConnection;
import loginVar.AnalysisSampleVariable;
import loginVar.analysisVariable;
import loginVar.appointmentVariable;
import loginVar.customerVariable;
import loginVar.customer_sampleVariable;
import loginVar.labVariable;
import loginVar.loginVariable;
import loginVar.sampleLabStaff;
import loginVar.sampleVariable;
import loginVar.userLoginVariable;
import loginVar.userVariable;

public class UserQuery {
	String sql, query;
	PreparedStatement statement;
	ResultSet result;
	 DBConnection con = new  DBConnection();
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	// ************************* SAMPLE RECORDS ********************//
	public static int saveSample(sampleVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();   
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO sample(SCode, SName, Brand, SType, Batch, ProdDate, ExpDate, Manufacture, RecDate, CustType, RQuantity, CCode, Remark, ResultDate, Approval,SampDate)"
							+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, u.getSCode());
			ps.setString(2, u.getSName());
			ps.setString(3, u.getBrand());
			ps.setString(4, u.getSType());
			ps.setString(5, u.getBatch());
			ps.setString(6, u.getProdDate());
			ps.setString(7, u.getExpDate());
			ps.setString(8, u.getManufacture());
			ps.setString(9, u.getRecDate());
			ps.setString(10, u.getCustType());
			ps.setInt(11, u.getRQuantity());
			ps.setString(12, u.getCCode());
			ps.setString(13, "Not yet");
			ps.setString(14, "Not yet");
			ps.setString(15, "Not yet");
			ps.setString(16, "Not yet");
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO INSERT DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("YOU FAIL TO INSERT DATA");
		}
		return status;
	}

	public static List<sampleVariable> getSample() {
		List<sampleVariable> list = new ArrayList<sampleVariable>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM sample WHERE SubmTo IS NULL");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sampleVariable u = new sampleVariable();
				u.setSCode(rs.getString("SCode"));
				u.setSName(rs.getString("SName"));
				u.setBrand(rs.getString("Brand"));
				u.setBatch(rs.getString("Batch"));
				u.setProdDate(rs.getString("ProdDate"));
				u.setExpDate(rs.getString("ExpDate"));
				u.setSType(rs.getString("SType"));
				u.setManufacture(rs.getString("Manufacture"));
				u.setRQuantity(rs.getInt("RQuantity"));
				u.setRecDate(rs.getString("RecDate"));
				u.setCCode(rs.getString("CCode"));
				u.setCustType(rs.getString("CustType"));
				u.setSampDate(rs.getString("SampDate"));
				u.setSubmTo(rs.getString("SubmTo"));
				u.setSubmDate(rs.getString("SubmDate"));
				u.setAnalyzerID(rs.getString("AnalyzerID"));
				u.setResultDate(rs.getString("ResultDate"));
				u.setRemark(rs.getString("Remark"));
				u.setApproval(rs.getString("Approval"));
				list.add(u);
			}con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static List<sampleVariable> getnewSample() {
		List<sampleVariable> list = new ArrayList<sampleVariable>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT *FROM sample,lab,staff WHERE (sample.SubmTo=lab.LabID AND lab.Sup_ID=staff.SID AND (sample.AnalyzerID IS NULL))");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sampleVariable u = new sampleVariable();
				u.setSCode(rs.getString("SCode"));
				u.setSName(rs.getString("SName"));
				u.setBrand(rs.getString("Brand"));
				u.setBatch(rs.getString("Batch"));
				u.setProdDate(rs.getString("ProdDate"));
				u.setExpDate(rs.getString("ExpDate"));
				u.setSType(rs.getString("SType"));
				u.setManufacture(rs.getString("Manufacture"));
				u.setRQuantity(rs.getInt("RQuantity"));
				u.setRecDate(rs.getString("RecDate"));
				u.setCCode(rs.getString("CCode"));
				u.setCustType(rs.getString("CustType"));
				u.setSampDate(rs.getString("SampDate"));
				u.setSubmTo(rs.getString("SubmTo"));
				u.setSubmDate(rs.getString("SubmDate"));
				u.setAnalyzerID(rs.getString("AnalyzerID"));
				u.setResultDate(rs.getString("ResultDate"));
				u.setRemark(rs.getString("Remark"));
				u.setApproval(rs.getString("Approval"));
				list.add(u);
			}con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

public static List<sampleVariable> allreceiveSample() {
	List<sampleVariable> list = new ArrayList<sampleVariable>();
	try {
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT *FROM sample S,customer C,lab L WHERE (S.CCode=C.CCode AND S.SubmTo=L.LabID)");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			sampleVariable u = new sampleVariable();
			u.setSCode(rs.getString("SCode"));
			u.setSName(rs.getString("SName"));
			u.setBrand(rs.getString("Brand"));
			u.setBatch(rs.getString("Batch"));
			u.setProdDate(rs.getString("ProdDate"));
			u.setExpDate(rs.getString("ExpDate"));
			u.setSType(rs.getString("SType"));
			u.setManufacture(rs.getString("Manufacture"));
			u.setRQuantity(rs.getInt("RQuantity"));
			u.setRecDate(rs.getString("RecDate"));
			u.setCCode(rs.getString("CCode"));
			u.setCustType(rs.getString("CustType"));
			u.setSampDate(rs.getString("SampDate"));
			u.setSubmTo(rs.getString("SubmTo"));
			u.setSubmDate(rs.getString("SubmDate"));
			u.setAnalyzerID(rs.getString("AnalyzerID"));
			u.setResultDate(rs.getString("ResultDate"));
			u.setRemark(rs.getString("Remark"));
			u.setApproval(rs.getString("Approval"));
			list.add(u);
		}con.close();
	} catch (Exception e) {
		System.out.println(e);
	}
	return list;
}

	// SELECT RECORDS FOR EDIT SAMPLE FORM
		public static sampleVariable getRecordById1(String SCode) {
			sampleVariable L = null;
			try {
				Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement("SELECT * FROM sample WHERE SCode=?");
				ps.setString(1, SCode);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					L = new sampleVariable();
					L.setSCode(rs.getString("SCode"));
					L.setSName(rs.getString("SName"));
					L.setBrand(rs.getString("Brand"));
					L.setSType(rs.getString("SType"));
					L.setBatch(rs.getString("Batch"));
					L.setProdDate(rs.getString("ProdDate"));
					L.setExpDate(rs.getString("ExpDate"));
					L.setManufacture(rs.getString("Manufacture"));
					L.setRecDate(rs.getString("RecDate"));
					L.setCustType(rs.getString("CustType"));
					L.setRQuantity(rs.getInt("RQuantity"));
					L.setCCode(rs.getString("CCode"));
				}con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
			return L;
		}
		
	
	public static int updateSendSamp(sampleVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE sample SET SubmTo=?, RQuantity=?, SubmDate=? WHERE SCode=?");
			ps.setString(1, u.getSubmTo());
			ps.setInt(2, u.getRQuantity());
			ps.setString(3, u.getSubmDate());
			ps.setString(4, u.getSCode());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int AssignUserSamples(sampleVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE sample SET AnalyzerID=? WHERE SCode=?");
			ps.setString(1, u.getAnalyzerID());
			ps.setString(2, u.getSCode());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateSamples(sampleVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE sample SET SCode=?,SName=?,Brand=?,SType=?,Batch=?,ProdDate=?,ExpDate=?,"
					+ "Manufacture=?,RecDate=?,CustType=?,RQuantity=?,CCode=? WHERE SCode=?");
			ps.setString(1, u.getSCode());
			ps.setString(2, u.getSName());
			ps.setString(3, u.getBrand());
			ps.setString(4, u.getSType());
			ps.setString(5, u.getBatch());
			ps.setString(6, u.getProdDate());
			ps.setString(7, u.getExpDate());
			ps.setString(8, u.getManufacture());
			ps.setString(9, u.getRecDate());
			ps.setString(10, u.getCustType());
			ps.setInt(11, u.getRQuantity());
			ps.setString(12, u.getCCode());
			ps.setString(13, u.getSCode());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	// *********************** RESULT QUERIES***************************************************************************** //
		public static int saveResult(analysisVariable u) {
			int status = 0;
			try {
				Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement("INSERT INTO analysis(SCode, Water, Protein, Sugar, Calcium, Sodium, Zink, Energy, Caffein, Starch, Alkohol, FatyAcid)VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1, u.getSCode());
				ps.setString(2, u.getWater());
				ps.setString(3, u.getProtein());
				ps.setString(4, u.getSugar());
				ps.setString(5, u.getCalcium());
				ps.setString(6, u.getSodium());
				ps.setString(7, u.getZink());
				ps.setString(8, u.getEnergy());
				ps.setString(9, u.getCaffein());
				ps.setString(10, u.getStarch());
				ps.setString(11, u.getAlkohol());
				ps.setString(12, u.getFatyAcid());
				status = ps.executeUpdate();
				
				PreparedStatement ps1 = con.prepareStatement("UPDATE Sample SET Remark=?, ResultDate=? WHERE SCode=?");
				ps1.setString(1, u.getRemark());  
				ps1.setString(2, u.getResultDate());
				ps1.setString(3, u.getSCode());
				ps1.executeUpdate();
				System.out.println("YOU HAVA SUCCESS TO INSERT DATA");
				con.close();
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("YOU FAIL TO INSERT DATA");
			}
			return status;
		}
		
		    	 	 	 	 	 	 	 	 	 	 	
		
		public static int updateResult(analysisVariable u) {
			int status = 0;
			try {
				Connection con = getConnection();
				PreparedStatement ps = con
						.prepareStatement("UPDATE analysis SET Water=?,Protein=?, Sugar=?, Calcium=?, Sodium=?, Zink=?, Energy=?, Caffein=?, Starch=?, Alkohol=?, FatyAcid=? WHERE Analyzer=?");
				ps.setString(1, u.getWater());
				ps.setString(2, u.getProtein());
				ps.setString(3, u.getSugar());
				ps.setString(4, u.getCalcium());
				ps.setString(5, u.getSodium());
				ps.setString(6, u.getZink());
				ps.setString(7, u.getEnergy());
				ps.setString(8, u.getCaffein());
				ps.setString(9, u.getStarch());
				ps.setString(10, u.getAlkohol());
				ps.setString(11, u.getFatyAcid());
				ps.setInt(12, u.getAnalyzer());
				status = ps.executeUpdate();

				System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
				con.close();
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("YOU FAIL TO UPDATE DATA");
			}
			return status;
		}
		
		
	// *********************** CUSTOMER QUERIES***************************************************************************** //
	public static int regCustomer(userLoginVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("INSERT INTO Customer(CCode,CName,FName, MName, LName, Title, Gender, Address, Phone, Email, DOB, Status,Request,Photo) "
							+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, u.getCCode());
			ps.setString(2, u.getCName());
			ps.setString(3, u.getFName());
			ps.setString(4, u.getMName());
			ps.setString(5, u.getLName());
			ps.setString(6, u.getTitle());
			ps.setString(7, u.getGender());
			ps.setString(8, u.getAddress());
			ps.setString(9, u.getPhone());
			ps.setString(10, u.getEmail());
			ps.setString(11, u.getDob());
			ps.setString(12, u.getStatus());
			ps.setString(13, "Registered");
			ps.setString(14, "Img.png");
			status = ps.executeUpdate();
			
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO Login (Username, Password, Status, CCode)VALUES (?, ?, ?,?)");
			ps1.setString(1, u.getEmail());  
			ps1.setString(2, u.getPassword());
			ps1.setString(3, u.getStatus());
			ps1.setString(4, u.getCCode());
			ps1.executeUpdate();

			System.out.println("YOU HAVA SUCCESS TO INSERT DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("YOU FAIL TO INSERT DATA");
		}
		return status;
	}
	
	public static userLoginVariable getRecordById4(String CCode) {
		userLoginVariable u = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM Customer WHERE CCode=?");
			ps.setString(1, CCode);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new userLoginVariable();				
				u.setCCode(rs.getString("CCode"));
				u.setCName(rs.getString("CName"));
				u.setFName(rs.getString("FName"));
				u.setMName(rs.getString("MName"));
				u.setLName(rs.getString("LName"));
				u.setPhone(rs.getString("Phone"));
				u.setGender(rs.getString("Gender"));
				u.setEmail(rs.getString("Email"));
				u.setDob(rs.getString("DOB"));
				u.setTitle(rs.getString("Title"));
				u.setAddress(rs.getString("Address"));
				u.setStatus(rs.getString("Status"));
				u.setRequest(rs.getString("Request"));
				System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
			}con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}
	
	public static int updateCust(userLoginVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("UPDATE Customer SET CName=?,FName=?, MName=?, LName=?, Title=?, Gender=?, Address=?, Phone=?, DOB=? WHERE CCode=?");
			ps.setString(1, u.getCName());
			ps.setString(2, u.getFName());
			ps.setString(3, u.getMName());
			ps.setString(4, u.getLName());
			ps.setString(5, u.getTitle());
			ps.setString(6, u.getGender());
			ps.setString(7, u.getAddress());
			ps.setString(8, u.getPhone());
			ps.setString(9, u.getDob());
			ps.setString(10, u.getCCode());
			status = ps.executeUpdate();

			System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("YOU FAIL TO UPDATE DATA");
		}
		return status;
	}

	public static List<userLoginVariable> getCustomer() {
		List<userLoginVariable> list = new ArrayList<userLoginVariable>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM Customer WHERE Request!='Registered'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				userLoginVariable u = new userLoginVariable();
				u.setCCode(rs.getString("CCode"));
				u.setCName(rs.getString("CName"));
				u.setFName(rs.getString("FName"));
				u.setMName(rs.getString("MName"));
				u.setLName(rs.getString("LName"));
				u.setPhone(rs.getString("Phone"));
				u.setGender(rs.getString("Gender"));
				u.setEmail(rs.getString("Email"));
				u.setDob(rs.getString("DOB"));
				u.setTitle(rs.getString("Title"));
				u.setAddress(rs.getString("Address"));
				u.setStatus(rs.getString("Status"));
				u.setRequest(rs.getString("Request"));
				list.add(u);
			}con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static int deleteCustomer(customerVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM customer WHERE CCode=?");
			ps.setString(1, u.getCCode());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO DELETE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	// SELECT RECORDS FOR ID REQUEST CUST FORM
	
	@SuppressWarnings("null")
	public static customerVariable getRecordById31(String CCode) {
		customerVariable u = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM Customer WHERE CCode=?");
			ps.setString(1, CCode);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u.setCCode(rs.getString("CCode"));
				u.setCName(rs.getString("CName"));
				u.setFName(rs.getString("FName"));
				u.setMName(rs.getString("MName"));
				u.setLName(rs.getString("LName"));
				u.setPhone(rs.getString("Phone"));
				u.setGender(rs.getString("Gender"));
				u.setEmail(rs.getString("Email"));
				u.setDob(rs.getString("DOB"));
				u.setTitle(rs.getString("Title"));
				u.setAddress(rs.getString("Address"));
				u.setStatus(rs.getString("Status"));
				u.setRequest(rs.getString("Request"));
			}con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}
	
	public static List<customerVariable> getNewsCust() {
		List<customerVariable> list = new ArrayList<customerVariable>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from Customer,appointdate WHERE "
					+ "(Customer.CCode=appointdate.CCode AND Customer.Request='Registered' AND appointdate.AppID!='NULL')");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				customerVariable u = new customerVariable();
				u.setCCode(rs.getString("CCode"));
				u.setCName(rs.getString("CName"));
				u.setFName(rs.getString("FName"));
				u.setMName(rs.getString("MName"));
				u.setLName(rs.getString("LName"));
				u.setPhone(rs.getString("Phone"));
				u.setGender(rs.getString("Gender"));
				u.setEmail(rs.getString("Email"));
				u.setDob(rs.getString("DOB"));
				u.setTitle(rs.getString("Title"));
				u.setAddress(rs.getString("Address"));
				u.setStatus(rs.getString("Status"));
				u.setRequest(rs.getString("Request"));
				list.add(u);
			}con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	// *********************** USER QUERIES********************** //

	public static List<userVariable> getAllUser() {
		List<userVariable> list = new ArrayList<userVariable>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM staff WHERE Status='Lab Expart'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				userVariable u = new userVariable();
				u.setSID(rs.getString("SID"));
				u.setFName(rs.getString("FName"));
				u.setMName(rs.getString("MName"));
				u.setLName(rs.getString("LName"));
				u.setTitle(rs.getString("Title"));
				u.setGender(rs.getString("Gender"));
				u.setAddress(rs.getString("Address"));
				u.setPhone(rs.getString("Phone"));
				u.setEmail(rs.getString("Email"));
				u.setSID(rs.getString("SID"));
				u.setStatus(rs.getString("Status"));
				u.setSignature(rs.getString("Signature"));
				u.setPhoto(rs.getString("Photo"));
				u.setDOB(rs.getString("DOB"));
				u.setLabID(rs.getString("LabID"));
				list.add(u);
			}con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public static List<userVariable> getSampleReceiver() {
		List<userVariable> list = new ArrayList<userVariable>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM staff WHERE Status='Receiver'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				userVariable u = new userVariable();
				u.setSID(rs.getString("SID"));
				u.setFName(rs.getString("FName"));
				u.setMName(rs.getString("MName"));
				u.setLName(rs.getString("LName"));
				u.setTitle(rs.getString("Title"));
				u.setGender(rs.getString("Gender"));
				u.setAddress(rs.getString("Address"));
				u.setPhone(rs.getString("Phone"));
				u.setEmail(rs.getString("Email"));
				u.setSID(rs.getString("SID"));
				u.setStatus(rs.getString("Status"));
				u.setSignature(rs.getString("Signature"));
				u.setPhoto(rs.getString("Photo"));
				u.setDOB(rs.getString("DOB"));
				u.setLabID(rs.getString("LabID"));
				list.add(u);
			}con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public static int saveUser(userLoginVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("INSERT INTO staff(FName, MName, LName, Title, Gender, Address, Phone, Email, "
							+ "SID, Status, Signature, Photo, DOB, LabID) " + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, u.getFName());
			ps.setString(2, u.getMName());
			ps.setString(3, u.getLName());
			ps.setString(4, u.getTitle());
			ps.setString(5, u.getGender());
			ps.setString(6, u.getAddress());
			ps.setString(7, u.getPhone());
			ps.setString(8, u.getEmail());
			ps.setString(9, u.getSID());
			ps.setString(10, u.getStatus());
			ps.setString(11, u.getSignature());
			ps.setString(12, "Img.png");
			ps.setString(13, u.getDOB());
			ps.setString(14, u.getLabID());
			status = ps.executeUpdate();
			
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO Login (Username, Password, Status, SID)VALUES (?, ?, ?,?)");
			ps1.setString(1, u.getEmail());  
			ps1.setString(2, "12345");
			ps1.setString(3, u.getStatus());
			ps1.setString(4, u.getSID());
			ps1.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO INSERT DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("YOU FAIL TO INSERT DATA");
		}
		return status;
	}

	public static int saveUserLogin(loginVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO LOGIN(LoginID, Username, Password, Status, CCode, SID)" + "VALUES(?,?,?,?,?,?)");
			ps.setInt(1, u.getLoginID());
			ps.setString(2, u.getUsername());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getCCode());
			ps.setString(5, u.getSID());
			ps.setString(6, u.getStatus());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO INSERT DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("YOU FAIL TO INSERT DATA");
		}
		return status;
	}

	// SELECT RECORDS FOR EDIT LABEXP FORM
	public static userVariable getRecordByIds(String SID) {
		userVariable U = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM staff WHERE SID=?");
			ps.setString(1, SID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				U = new userVariable();
				U.setSID(rs.getString("SID"));
				U.setFName(rs.getString("FName"));
				U.setMName(rs.getString("MName"));
				U.setLName(rs.getString("LName"));
				U.setTitle(rs.getString("Title"));
				U.setGender(rs.getString("Gender"));
				U.setAddress(rs.getString("Address"));
				U.setPhone(rs.getString("Phone"));
				U.setEmail(rs.getString("Email"));
				U.setSID(rs.getString("SID"));
				U.setSignature(rs.getString("Signature"));
				U.setDOB(rs.getString("DOB"));
				U.setStatus(rs.getString("Status"));
				U.setLabID(rs.getString("LabID"));
				System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return U;
	}
	
	

	public static int updateProfile(userLoginVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE staff SET FName=?,MName=?,LName=?,Title=?,Gender=?,Address=?,Phone=?,Email=?,Status=?,DOB=? WHERE SID=?");
			ps.setString(1, u.getFName());
			ps.setString(2, u.getMName());
			ps.setString(3, u.getLName());
			ps.setString(4, u.getTitle());
			ps.setString(5, u.getGender());
			ps.setString(6, u.getAddress());
			ps.setString(7, u.getPhone());
			ps.setString(8, u.getEmail());
			ps.setString(9, u.getStatus());
			ps.setString(10, u.getDOB());
			ps.setString(11, u.getSID());
			status = ps.executeUpdate();
			
			PreparedStatement ps1 = con.prepareStatement("UPDATE Login SET Username=? WHERE SID=?");
			ps1.setString(1, u.getEmail());  
			ps1.setString(2, u.getSID());
			status = ps1.executeUpdate();;
			System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateCustProfile(userLoginVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE Customer SET FName=?,MName=?,LName=?,CName=?,Title=?,Gender=?,Address=?,Phone=?,Email=?,Status=?,DOB=? WHERE CCode=?");
			ps.setString(1, u.getFName());
			ps.setString(2, u.getMName());
			ps.setString(3, u.getLName());
			ps.setString(4, u.getCName());
			ps.setString(5, u.getTitle());
			ps.setString(6, u.getGender());
			ps.setString(7, u.getAddress());
			ps.setString(8, u.getPhone());
			ps.setString(9, u.getEmail());
			ps.setString(10, u.getStatus());
			ps.setString(11, u.getDOB());
			ps.setString(12, u.getCCode());
			status = ps.executeUpdate();
			
			PreparedStatement ps1 = con.prepareStatement("UPDATE Login SET Username=? WHERE CCode=?");
			ps1.setString(1, u.getEmail());  
			ps1.setString(2, u.getCCode());
			status = ps1.executeUpdate();;
			System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateLabExp(userVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE staff SET FName=?,MName=?,LName=?,Title=?,Gender=?,Address=?,Phone=?,Email=?,SID=?,Status=?,DOB=?,LabID=? WHERE SID=?");
			ps.setString(1, u.getFName());
			ps.setString(2, u.getMName());
			ps.setString(3, u.getLName());
			ps.setString(4, u.getTitle());
			ps.setString(5, u.getGender());
			ps.setString(6, u.getAddress());
			ps.setString(7, u.getPhone());
			ps.setString(8, u.getEmail());
			ps.setString(9, u.getSID());
			ps.setString(10, u.getStatus());
			ps.setString(11, u.getDOB());
			ps.setString(12, u.getLabID());
			ps.setString(13, u.getSID());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int deleteLabExp(userVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM staff WHERE SID=?");
			ps.setString(1, u.getSID());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO DELETE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	// *********************** APPOINTMENTS  QUERIES********************** //
	public static List<customerVariable> getReq() {
		List<customerVariable> list = new ArrayList<customerVariable>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select COUNT(Request) from Customer WHERE Request='Pending'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				customerVariable u = new customerVariable();
				u.setRequest(rs.getString("Request"));
				list.add(u);
			}con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static int rejectCustomer(customerVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE customer SET Request=? WHERE CCode=?");
			ps.setString(1, "Rejected");
			ps.setString(2, u.getCCode());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO DELETE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int saveRequests(appointmentVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into appointdate(SampType,CCode) values(?,?)");
			ps.setString(1, u.getSampType());
			ps.setString(2, u.getCCode());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO INSERT DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("YOU FAIL TO INSERT DATA");
		}
		return status;
	}
	
	public static int acceptRequest(appointmentVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("UPDATE appointdate SET CommingDate=?, OptionalDate=? WHERE CCode=?");
			ps.setString(1, u.getCommingDate());
			ps.setString(2, u.getOptionalDate());
			ps.setString(3, u.getCCode());
			status = ps.executeUpdate();
			
			PreparedStatement ps2 = con.prepareStatement("UPDATE Customer SET  Request=? WHERE CCode=?");
			ps2.setString(1, "Accepted");
			ps2.setString(2, u.getCCode());
			ps2.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO ACCEPT DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("YOU FAIL TO ACCEPT DATA");
		}
		return status;
	}
	
	// *********************** LAB QUERIES********************** //

	public static int save(labVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into lab(LabID,LabName,Location,Sup_ID) values(?,?,?,?)");
			ps.setString(1, u.getLabID());
			ps.setString(2, u.getLabName());
			ps.setString(3, u.getLocation());
			ps.setString(4, u.getSup_ID());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO INSERT DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("YOU FAIL TO INSERT DATA");
		}
		return status;
	}

	public static List<labVariable> getLabRec() {
		List<labVariable> list = new ArrayList<labVariable>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from Lab WHERE LabName !='STORE'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				labVariable u = new labVariable();
				u.setLabID(rs.getString("LabID"));
				u.setLabName(rs.getString("LabName"));
				u.setLocation(rs.getString("Location"));
				u.setSup_ID(rs.getString("Sup_ID"));
				list.add(u);
			}con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	// SELECT RECORDS FOR EDIT LABS FORM
	public static labVariable getRecordById(String LabID) {
		labVariable L = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM Lab WHERE LabID=?");
			ps.setString(1, LabID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				L = new labVariable();
				L.setLabID(rs.getString("LabID"));
				L.setLabName(rs.getString("LabName"));
				L.setLocation(rs.getString("Location"));
				L.setSup_ID(rs.getString("Sup_ID"));
				System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
			}con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return L;
	}

	public static int updateLab(labVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("UPDATE Lab SET LabID=?, LabName=?,Location=?,Sup_ID=? WHERE LabID=?");
			ps.setString(1, u.getLabID());
			ps.setString(2, u.getLabName());
			ps.setString(3, u.getLocation());
			ps.setString(4, u.getSup_ID());
			ps.setString(5, u.getLabID());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO UPDATE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int deleteLab(labVariable u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM Lab WHERE LabID=?");
			ps.setString(1, u.getLabID());
			status = ps.executeUpdate();
			System.out.println("YOU HAVA SUCCESS TO DELETE DATA");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
   //	***************************************************************
}
