package dbpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Dao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public List<Map<Integer,String>> pList(){
		List<Map<Integer,String>> list = new ArrayList<>();
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@//localhost:1521/xe","C##system","1234");
			rs = conn.prepareStatement(
					"select p_no,p_name,"
					+ "substr(p_birth,1,4)||'년'||substr(p_birth,5,2)||'월'||substr(p_birth,7,2)||'일', "
					+ "decode(p_gender,'M','남','F','여'),"
					+ "p_tel1||'-'||p_tel2||'-'||p_tel3,"
					+ "DECODE(p_city,'10','서울','20','경기','30','강원','40','대구') "
					+ "from TBL_PATIENT_202004").executeQuery();
			while(rs.next()){
				Map<Integer,String> info = new HashMap<>();
				info.put(1,rs.getString(1) );
				info.put(2,rs.getString(2) );
				info.put(3,rs.getString(3) );
				info.put(4,rs.getString(4) );
				info.put(5,rs.getString(5) );
				info.put(6,rs.getString(6) );
				list.add(info);
			}
		}catch(Exception e){
			System.out.println("pList : 예외발생");
			e.printStackTrace();
		}finally {
			 try {
				if(conn!=null) {conn.close(); }
				if(pstmt!=null) { pstmt.close(); }
				if(rs!=null) { rs.close(); }
			} catch (SQLException e) {
				e.printStackTrace();
			} 			
		}
		return list;
	}
	
	public List<Map<Integer,String>> rList(){
		List<Map<Integer,String>> list = new ArrayList<>();
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@//localhost:1521/xe","C##system","1234");
			rs = conn.prepareStatement(
					"SELECT P.P_NO,P.P_NAME,l.t_name,TO_CHAR(R.T_SDATE,'YYYY-MM-DD'),"
					+ "DECODE(r.t_status,'1','검사중','2','검사완료'),TO_CHAR(r.t_ldate,'YYYY-MM-DD'),"
					+ "DECODE(r.t_result,'X','미입력','P','양성','N','음성') "
					+ "FROM TBL_PATIENT_202004 P "
					+ "JOIN TBL_RESULT_202004 R ON P.P_NO = R.P_NO "
					+ "JOIN TBL_LAB_TEST_202004 L ON R.T_CODE = L.T_CODE "
					+ "ORDER BY P.P_NO"
					).executeQuery();
			while(rs.next()){
				Map<Integer,String> info = new HashMap<>();
				info.put(1,rs.getString(1) );
				info.put(2,rs.getString(2) );
				info.put(3,rs.getString(3) );
				info.put(4,rs.getString(4) );
				info.put(5,rs.getString(5) );
				info.put(6,rs.getString(6) );
				info.put(7,rs.getString(7) );
				list.add(info);
			}
		}catch(Exception e){
			System.out.println("rList : 예외발생");
			e.printStackTrace();
		}finally {
			 try {
				if(conn!=null) {conn.close(); }
				if(pstmt!=null) { pstmt.close(); }
				if(rs!=null) { rs.close(); }
			} catch (SQLException e) {
				e.printStackTrace();
			} 			
		}
		return list;
	}
	
	public List<Map<Integer,String>> rankList(){
		List<Map<Integer,String>> list = new ArrayList<>();
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@//localhost:1521/xe","C##system","1234");
			rs = conn.prepareStatement(
					"SELECT P.P_CITY, DECODE(P.p_city,'10','서울','20','경기','30','강원','40','대구'), COUNT(P.P_CITY) "
					+ "FROM TBL_PATIENT_202004 P JOIN TBL_RESULT_202004 R ON P.P_NO = R.P_NO "
					+ "GROUP BY P.P_CITY").executeQuery();
			while(rs.next()){
				Map<Integer,String> info = new HashMap<>();
				info.put(1,rs.getString(1) );
				info.put(2,rs.getString(2) );
				info.put(3,rs.getString(3) );
				list.add(info);
			}
		}catch(Exception e){
			System.out.println("rankList : 예외발생");
			e.printStackTrace();
		}finally {
			 try {
				if(conn!=null) {conn.close(); }
				if(pstmt!=null) { pstmt.close(); }
				if(rs!=null) { rs.close(); }
			} catch (SQLException e) {
				e.printStackTrace();
			} 			
		}
		return list;
	}
	
	//////////////
	
	public int insertP(String a,String b,String c,String d,String e,String f){
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@//localhost:1521/xe","C##system","1234");
			pstmt = conn.prepareStatement(
					"insert into TBL_RESULT_202004 values(?,?,to_date(?),?,to_date(?),?)");
			System.out.println("insert into TBL_RESULT_202004 values("+a+","+b+",to_date("+c+"),"+d+",to_date("+e+"),"+f+")");
			pstmt.setString(1, a);
			pstmt.setString(2, b);
			pstmt.setString(3, c);
			pstmt.setString(4, d);
			pstmt.setString(5, e);
			pstmt.setString(6, f);
			return pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("insertP : 예외발생");
			ex.printStackTrace();
		}finally {
			 try {
				if(conn!=null) {conn.close(); }
				if(pstmt!=null) { pstmt.close(); }
				if(rs!=null) { rs.close(); }
			} catch (SQLException ex) {
				ex.printStackTrace();
			} 			
		}
		return -1;
	}

}
