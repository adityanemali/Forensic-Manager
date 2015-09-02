
<%@page import="com.dts.core.util.CoreHash"%>
<%@page import="com.dts.project.dao.CaseTypeDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.dts.project.model.CaseTypeModel"%>
<%@page import="com.dts.project.dao.ClientDAO"%>
<%@page import="com.dts.project.model.ClientModel"%>
<%@page import="com.dts.project.dao.CourtDAO"%>
<%@page import="com.dts.project.model.CourtModel"%>
<%@page import="com.dts.project.dao.LawyerDAO"%>
<%@page import="com.dts.project.model.LawyerModel"%>
<%@page import="com.dts.project.dao.SectionDAO"%>
<%@page import="com.dts.project.model.SectionModel"%>
<%@page import="com.dts.project.dao.EvidenceTypeDAO"%>
<%@page import="com.dts.project.model.EvidenceTypeModel"%>
<%@page import="com.dts.project.dao.CaseRegistrationDAO"%>
<%@page import="com.dts.project.model.CaseRegistrationModel"%>
<%@page import="com.dts.project.dao.CaseHearingDAO"%>
<%@page import="com.dts.project.model.CaseHearingModel"%>
<%@page import="com.dts.project.dao.CaseMemberDAO"%>
<%@page import="com.dts.project.model.CaseMemberModel"%>
<%@page import="com.dts.project.dao.CaseWitnessDAO"%>
<%@page import="com.dts.project.model.CaseWitnessModel"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>Home Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="css/mm_health_nutr.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
//--------------- LOCALIZEABLE GLOBALS ---------------
var d=new Date();
var monthname=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
//Ensure correct for language. English is "January 1, 2004"
var TODAY = monthname[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
//---------------   END LOCALIZEABLE   ---------------
function inDate(){

  var date=new Date();
  document.updatecaseregistration.caseregistrationdate.value=date.getDate()+"-"+(date.getMonth()+1)+"-"+date.getYear();
  
}


function inDate2(){

  var date=new Date();
  document.updatecaseregistration.lawyeracceptdate.value=date.getDate()+"-"+(date.getMonth()+1)+"-"+date.getYear();
  
}
function inDate3(){

  var date=new Date();
  document.updatecaseregistration.evidenceregdate.value=date.getDate()+"-"+(date.getMonth()+1)+"-"+date.getYear();
  
}
function inDate4(){

  var date=new Date();
  document.updatecaseregistration.nexthearingdate.value=date.getDate()+"-"+(date.getMonth()+1)+"-"+date.getYear();
  
}

function inDate5(){

  var date=new Date();
  document.updatecaseregistration.caseregistrationdate.value=date.getDate()+"-"+(date.getMonth()+1)+"-"+date.getYear();
  
}
function checkfuturedate() {

var temp = document.updatecaseregistration;

var start_date = temp.nexthearingdate.value; 
  
// Break up the start date - using the delimiter "/" - into an array of strings  
start_date = start_date.split("-"); 
  
// Access each element in the array. 
year = start_date[2];  
month = start_date[1]; 
day = start_date[0];  
   
/// Some basic date validation /// 
// did they enter number?  
if (isNaN(day) || isNaN(month) || isNaN(year)) { 
   alert("Invalid number. Please ensure the day, month and    year are valid numbers.");  
   return false;  
} 
  
// check month range 
if (month < 1 || month > 12) {  
   alert("Invalid Month. Please ensure that the month is    between 1 and 12 inclusive.");  
   return false;  
} 
  
// check day range 
if (day < 1 || day > 31) {  
   alert("Invalid Day. Please ensure that the day is between    1 and 31 inclusive.");  
   return false;  
} 
  
// check day/month combination 
if ((month==4 || month==6 || month==9 || month==11) && day==31) { 
   alert("Invalid Day/Month combination. Please ensure that    you have a valid day/month combination."); 
   return false; 
} 
   
// check for february 29th 
if (month == 2) {  
   var isleap = (year % 4 == 0 && (year % 100 != 0 || year %    400 == 0)); 
   if (day>29 || (day==29 && !isleap)) {  
      alert("Invalid Day. This year is not a leap year.       Please enter a value less than 29 for the day."); 
      return false; 
   } 
} 
  
// Set the start date using the Date object and pass it our date parameters. 
// NOTE: when passing the month as a number, remember that the array starts at 0. // So Jan = 0, Feb = 1 ... Dec = 11 
var sDate = new Date(year,month-1,day);  
  
// get the current date based on client's computer clock 
var today = new Date();  
  
// what is the difference between the start date and today's date 
diff = sDate-today; 
  
// get the difference in days 
diff1 = Math.ceil(diff/1000/60/60/24); 
  
if ((diff1) <0) { 
   alert("Invalid Start Date. Please specify a date that is    in the future and not the past.");  
   return false; 
} 
  
// the date is valid!!!  
else
 alert("It Is Correct."); 

return true; 
}

</script>
<style type="text/css">
input {
width: 125px;
font-family: Verdana;
font-size: 8pt;
}
</style>
</head>
<body bgcolor="#F4FFE4">
<table width="103%" border="0" cellspacing="0" cellpadding="0">
  <tr bgcolor="#D5EDB3">
    <td height="51" colspan="2" bgcolor="#0D4961"><img src="images/Legal Management System.jpg" alt="s" width="800" height="139" /></td>
  </tr>


  <tr>
    <td colspan="2" bgcolor="#5C743D"><img src="images/mm_spacer.gif" alt="" width="1" height="2" border="0" /></td>
  </tr>

  <tr>
    <td height="10" colspan="2" bgcolor="#000000">&nbsp;</td>
  </tr>

  <tr>
    <td width="100%" align="left" valign="top" bgcolor="#A4C2C2">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#A4C2C2">
  <tr>
    <td width="5%" bgcolor="#a4c2c2">&nbsp;</td>
    <td height="5%" colspan="0" align="left" valign="top" bgcolor="#a4c2c2" class="navText" id="navigation">
	<% String role=(String)session.getAttribute("user"); 
	if(role.equalsIgnoreCase("Admin")){
	 %>
	<jsp:include page="adminoptions.html"/></td>
	<%}else { %>
	
	<jsp:include page="clientoptions.html"/>
	<%} %>
    <td width="5%" bgcolor="#a4c2c2">&nbsp;</td>
  </tr>
</table>
</td>
  </tr>
  

  <tr>
    <td colspan="2" bgcolor="#5C743D"><img src="images/mm_spacer.gif" alt="" width="1" height="2" border="0" /></td>
  </tr>


 <tr>
    <td valign="top" bgcolor="#F4FFE4">
    
    <table width="100%" border="0">
      <tr>
        <td width="17%"><br /></td>
        <td width="78%" align="left" valign="top"><br />
        <form name="updatecaseregistration" action="./UpdateCaseRegAction" method="post" onSubmit="return validate()" >     
<table align=center border=2 bordercolor=red><tr><td> <table align="center" WIDTH="800" border="0" bordercolor="black" bgcolor="#F4F5F7">
      <th colspan="4" bgcolor="black"><center><b><font color="white">CASE REGISTRATION DETAILS</font></center></th>
      <tr rowspan="5"></tr>
       
       <tr></tr><tr></tr>
     
     <tr><td><span class=Title>
    <%if(request.getParameter("status")!=null)out.print(request.getParameter("status"));    %> </span> </td></tr>

   <tr><td>
      Case ID </td><td> <select name="caseno" >
      <option value="select">-Select-</option>
       <% CoreHash chh=new CaseRegistrationDAO().getCaseID();
         Enumeration emh=chh.elements();
          CaseRegistrationModel caseregmodel=null;
         while(emh.hasMoreElements()){
             caseregmodel=(CaseRegistrationModel)emh.nextElement();
         %><option value="<%=caseregmodel.getCaseid() %>"><%=caseregmodel.getCaseid() %></option>
          <%  } %></select>  </td> 
       
   <td>	Case Type Name  </td><td><select name="casetypename">
      <option value="select">-Select-</option>
       <% CoreHash ch=new CaseTypeDAO().getCaseTypeNames();
         Enumeration em=ch.elements();
          CaseTypeModel casetypemodel=null;
         while(em.hasMoreElements()){
             casetypemodel=(CaseTypeModel)em.nextElement();
         %><option value="<%=casetypemodel.getCasetypeid() %>"><%=casetypemodel.getCasetypename() %></option>
          <%  } %></select>  </td></tr> 
         
     
     
         
            <tr><td> Client Name </td><td> 
                     <select name="clientname">
      <option value="select">-Select-</option>
    <% CoreHash ch1=new ClientDAO().getClientNames();
         Enumeration em1=ch1.elements();
          ClientModel clientmodel=null;
         while(em1.hasMoreElements()){
             clientmodel=(ClientModel)em1.nextElement();
         %>
         <option value="<%=clientmodel.getClientid() %>"><%=clientmodel.getClientfstname() %></option>
          <% }  %>  </select>  
         </td> 
         
     <td> Next Hearing Date </td><td>
     <input type="text" name="nexthearingdate"  onfocus="inDate4() "/>
     </td></tr>    
     
     
     
       <tr><td>  Court Name  </td><td>          
          <select name="courtname" >
          <option value="select">-Select-</option>
      <% CoreHash ch2=new CourtDAO().getCourtNames();
         Enumeration em2=ch2.elements();
          CourtModel courtmodel=null;
         while(em2.hasMoreElements()){
             courtmodel=(CourtModel)em2.nextElement();
         %>
         <option value="<%=courtmodel.getCourtid() %>"><%=courtmodel.getCourtname() %></option>
        <%             
         }         
        %>
      </select> </td>    
      
           <td> Lawyer Name </td><td>    <select name="lawyername"> 
            <option value="select">-Select-</option>
      <% CoreHash ch3=new LawyerDAO().getLawyerNames();
         Enumeration em3=ch3.elements();
          LawyerModel lawyermodel=null;
         while(em3.hasMoreElements()){
             lawyermodel=(LawyerModel)em3.nextElement();
         %>
         <option value="<%=lawyermodel.getLawyerid() %>"><%=lawyermodel.getLawyerfstname() %></option>
        <%  } %> </select> </td>  
        
        
             </tr>  
         
   
               
             
      <tr><td> Lawyer Accepted Date </td><td><input type="text" name="lawyeracceptdate" onfocus="inDate1()"  value=""/> </td> 
        <td> Lawyer Active State</td><td> <select name="lawyeractivestate" > 
       <option value="select">-Select-</option>
        <option value="Active">Active</option>
         <option value="DeActive">DeActive</option></select>
       </td></tr>
       
          
       <tr><td> Evidence Reg Date   </td><td>  <input type="text" name="evidenceregdate" onfocus="inDate3()"  value=""/> </td>     
        
        <td> Evidence Type Name </td><td> <select name="evidencetypename">
      <option value="select">-Select-</option>
       <% CoreHash ch5=new EvidenceTypeDAO().getEvidenceTypeNames();
         Enumeration em5=ch5.elements();
          EvidenceTypeModel evidencetypemodel=null;
         while(em5.hasMoreElements()){
             evidencetypemodel=(EvidenceTypeModel)em5.nextElement();
         %>
         <option value="<%=evidencetypemodel.getEvidencetypeid() %>"><%=evidencetypemodel.getEvidencetypename() %></option> 
         <%  }  %> 
         </select>  </td></tr>
         <tr><td> Evidence Type Description 	</td><td>  <textarea  name="evidencetypedesc" value=""></textarea> </td>  
         <td>Evidence Image  </td><td>      <input type=file name="evidenceimage" value=""/> </td></tr>
        
         <tr><td>Evidence  Vedio   </td><td>  <input type=file name="evidencevedio" value=""/> </td> 
       
        <td> Evidence Audio </td><td>       <input type=file name="evidenceaudio" value=""/> </td></tr>       
       
       
           
       
     <tr><td> Member  Name</td><td><select  name="memberfstname">
     
     <option value="select">-Select-</option>
       <% CoreHash ch6=new CaseMemberDAO().getCaseMemberID();
         Enumeration em6=ch6.elements();
          CaseMemberModel casemembermodel=null;
         while(em6.hasMoreElements()){
             casemembermodel=(CaseMemberModel)em6.nextElement();
         %>
         <option value="<%=casemembermodel.getCasememberid() %>"><%=casemembermodel.getCasememberfstname() %></option> 
         <%  }  %> 
         </select>  </td>     
<%--    <tr><td>  Member Middle Name</td><td><input type="text" name="membermidname" value=""/></td></tr>--%>
<%--     <tr><td> Member Last Name</td><td><input type="text"   name="memberlstname" value=""/></td></tr>--%>
       <td>Member Type</td><td><select name="membertype" >
      <option value="select">-Select-</option>
      <option value="Respondent">Respondent</option>
      <option value="Defendent">Defendent</option></select> </td></tr>     
      
     <tr><td> Sequence Number</td><td><input type="text" name="sequenceno" value=""/>  </td>    
      <td> Father Fst Name</td><td><input type="text" name="memberffstname" value=""/></td></tr>
<%--     <tr><td> Father Mid Name</td><td><input type="text" name="memberfmidname" value=""/> </td></tr>     --%>
<%--     <tr><td> Father Lst Name</td><td><input type="text" name="memberflstname" value=""/></td></tr>--%>
     <tr><td> Member Address</td><td><textarea rows=1 columns=1 name="memaddress" value=""></textarea></td> 
   <td> Member  Date Of Birth</td><td>
    <SELECT name=fday size=1 > 
          <OPTION selected value="00">DD</OPTION> 
          <OPTION  value="01">01</OPTION> 
          <OPTION value="02">02</OPTION> 
          <OPTION value="03">03</OPTION> 
          <OPTION value="04">04</OPTION> 
          <OPTION value="05">05</OPTION> 
          <OPTION value="06">06</OPTION> 
          <OPTION value="07">07</OPTION> 
          <OPTION value="08">08</OPTION> 
          <OPTION value="09">09</OPTION> 
          <OPTION value="10">10</OPTION> 
          <OPTION value="11">11</OPTION> 
          <OPTION value="12">12</OPTION> 
          <OPTION value="13">13</OPTION> 
          <OPTION value="14">14</OPTION> 
          <OPTION value="15">15</OPTION> 
          <OPTION value="16">16</OPTION> 
          <OPTION value="17">17</OPTION> 
          <OPTION value="18">18</OPTION> 
          <OPTION value="19">19</OPTION> 
          <OPTION value="20">20</OPTION> 
          <OPTION value="21">21</OPTION> 
          <OPTION value="22">22</OPTION> 
          <OPTION value="23">23</OPTION> 
          <OPTION value="24">24</OPTION> 
          <OPTION value="25">25</OPTION> 
          <OPTION value="26">26</OPTION> 
          <OPTION value="27">27</OPTION> 
          <OPTION value="28">28</OPTION> 
          <OPTION value="29">29</OPTION> 
          <OPTION value="30">30</OPTION> 
          <OPTION value="31">31</OPTION> 
        </SELECT> 
        <SELECT name=fmonth size=1> 
          <OPTION selected value="00">MM</OPTION> 
          <OPTION  value="01">Jan</OPTION> 
          <OPTION value="02">Feb</OPTION> 
          <OPTION value="03">Mar</OPTION> 
          <OPTION value="04">Apr</OPTION> 
          <OPTION value="05">May</OPTION> 
          <OPTION value="06">Jun</OPTION> 
          <OPTION value="07">Jul</OPTION> 
          <OPTION value="08">Aug</OPTION> 
          <OPTION value="09">Sep</OPTION> 
          <OPTION value="10">Oct</OPTION> 
          <OPTION value="11">Nov</OPTION> 
          <OPTION value="12">Dec</OPTION> 
        </SELECT> 
        <SELECT name=fyear size=1 > 
          <OPTION selected value="0000">YYYY</OPTION> 
          <OPTION value="1901">1901</OPTION> 
          <OPTION value="1902">1902</OPTION> 
          <OPTION value="1903">1903</OPTION> 
          <OPTION value="1904">1904</OPTION> 
          <OPTION value="1905">1905</OPTION> 
          <OPTION value="1906">1906</OPTION> 
          <OPTION value="1907">1907</OPTION> 
          <OPTION value="1908">1908</OPTION> 
          <OPTION value="1909">1909</OPTION> 
          <OPTION value="1910">1910</OPTION> 
          <OPTION value="1911">1911</OPTION> 
          <OPTION value="1912">1912</OPTION> 
          <OPTION value="1913">1913</OPTION> 
          <OPTION value="1914">1914</OPTION> 
          <OPTION value="1915">1915</OPTION> 
          <OPTION value="1916">1916</OPTION> 
          <OPTION value="1917">1917</OPTION> 
          <OPTION value="1918">1918</OPTION> 
          <OPTION value="1919">1919</OPTION> 
          <OPTION value="1920">1920</OPTION> 
          <OPTION value="1921">1921</OPTION> 
          <OPTION value="1922">1922</OPTION> 
          <OPTION value="1923">1923</OPTION> 
          <OPTION value="1924">1924</OPTION> 
          <OPTION value="1925">1925</OPTION> 
          <OPTION value="1926">1926</OPTION> 
          <OPTION value="1927">1927</OPTION> 
          <OPTION value="1928">1928</OPTION> 
          <OPTION value="1929">1929</OPTION> 
          <OPTION value="1930">1930</OPTION> 
          <OPTION value="1931">1931</OPTION> 
          <OPTION value="1932">1932</OPTION> 
          <OPTION value="1933">1933</OPTION> 
          <OPTION value="1934">1934</OPTION> 
          <OPTION value="1935">1935</OPTION> 
          <OPTION value="1936">1936</OPTION> 
          <OPTION value="1937">1937</OPTION> 
          <OPTION value="1938">1938</OPTION> 
          <OPTION value="1939">1939</OPTION> 
          <OPTION value="1940">1940</OPTION> 
          <OPTION value="1941">1941</OPTION> 
          <OPTION value="1942">1942</OPTION> 
          <OPTION value="1943">1943</OPTION> 
          <OPTION value="1944">1944</OPTION> 
          <OPTION value="1945">1945</OPTION> 
          <OPTION value="1946">1946</OPTION> 
          <OPTION value="1947">1947</OPTION> 
          <OPTION value="1948">1948</OPTION> 
          <OPTION value="1949">1949</OPTION> 
          <OPTION value="1950">1950</OPTION> 
          <OPTION value="1951">1951</OPTION> 
          <OPTION value="1952">1952</OPTION> 
          <OPTION value="1953">1953</OPTION> 
          <OPTION value="1954">1954</OPTION> 
          <OPTION value="1955">1955</OPTION> 
          <OPTION value="1956">1956</OPTION> 
          <OPTION value="1957">1957</OPTION> 
          <OPTION value="1958">1958</OPTION> 
          <OPTION value="1959">1959</OPTION> 
          <OPTION value="1960">1960</OPTION> 
          <OPTION value="1961">1961</OPTION> 
          <OPTION value="1962">1962</OPTION> 
          <OPTION value="1963">1963</OPTION> 
          <OPTION value="1964">1964</OPTION> 
          <OPTION value="1965">1965</OPTION> 
          <OPTION value="1966">1966</OPTION> 
          <OPTION value="1967">1967</OPTION> 
          <OPTION value="1968">1968</OPTION> 
          <OPTION value="1969">1969</OPTION> 
          <OPTION value="1970">1970</OPTION> 
          <OPTION value="1971">1971</OPTION> 
          <OPTION value="1972">1972</OPTION> 
          <OPTION value="1973">1973</OPTION> 
          <OPTION value="1974">1974</OPTION> 
          <OPTION value="1975">1975</OPTION> 
          <OPTION value="1976">1976</OPTION> 
          <OPTION value="1977">1977</OPTION> 
          <OPTION value="1978">1978</OPTION> 
          <OPTION value="1979">1979</OPTION> 
          <OPTION value="1980">1980</OPTION> 
          <OPTION value="1981">1981</OPTION> 
          <OPTION value="1982">1982</OPTION> 
          <OPTION value="1983">1983</OPTION> 
          <OPTION value="1984">1984</OPTION> 
          <OPTION value="1985">1985</OPTION> 
          <OPTION value="1986">1986</OPTION> 
          <OPTION value="1987">1987</OPTION> 
          <OPTION value="1988">1988</OPTION> 
          <OPTION value="1989">1989</OPTION> 
          <OPTION value="1990">1990</OPTION> 
          <OPTION value="1991">1991</OPTION> 
          <OPTION value="1992">1992</OPTION> 
          <OPTION value="1993">1993</OPTION> 
          <OPTION value="1994">1994</OPTION> 
          <OPTION value="1995">1995</OPTION> 
          <OPTION value="1996">1996</OPTION> 
          <OPTION value="1997">1997</OPTION> 
          <OPTION value="1998">1998</OPTION> 
          <OPTION value="1999">1999</OPTION> 
          <OPTION value="2000">2000</OPTION> 
          <OPTION value="2001">2001</OPTION> 
          <OPTION value="2002">2002</OPTION> 
          <OPTION value="2003">2003</OPTION> 
          <OPTION value="2004">2004</OPTION> 
          <OPTION value="2005">2005</OPTION> 
          <OPTION value="2006">2006</OPTION> 
          <OPTION value="2007">2007</OPTION> 
          <OPTION value="2008">2008</OPTION> 
          
        </SELECT> 
        <span ><sup><font color="red"> *</font></sup></span>  
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
        
        
        
        
        <tr><td>Witness Name  </td><td>  <select name="witnessfstname">
        <option value="select">-Select-</option>
       <% CoreHash ch8=new CaseWitnessDAO().getWitnessID();
         Enumeration em8=ch8.elements();
          CaseWitnessModel casewitnessmodel=null;
         while(em8.hasMoreElements()){
             casewitnessmodel=(CaseWitnessModel)em8.nextElement();
         %>
         <option value="<%=casewitnessmodel.getCasewitnessid() %>"><%=casewitnessmodel.getWitnessfstname() %></option> 
         <%  }  %> 
         </select>  </td> 

         <td>Witness Type  </td><td>
        <select name="witnesstype">
      <option  values="Select">-Select-</option> 
      <option  values="Respondent">Respondent</option>
      <option  values="Defendent">Defendent</option>
      </select>  </td></tr>
       
            
       <tr><td> Witness Sequence Number </td><td> <input type="text" name="witnessseqno" value=""/> </td>       
        
       
       <td>  Date Of Birth </td><td> <SELECT name=cday size=1 > 
          <OPTION selected value="00">DD</OPTION> 
          <OPTION  value="01">01</OPTION> 
          <OPTION value="02">02</OPTION> 
          <OPTION value="03">03</OPTION> 
          <OPTION value="04">04</OPTION> 
          <OPTION value="05">05</OPTION> 
          <OPTION value="06">06</OPTION> 
          <OPTION value="07">07</OPTION> 
          <OPTION value="08">08</OPTION> 
          <OPTION value="09">09</OPTION> 
          <OPTION value="10">10</OPTION> 
          <OPTION value="11">11</OPTION> 
          <OPTION value="12">12</OPTION> 
          <OPTION value="13">13</OPTION> 
          <OPTION value="14">14</OPTION> 
          <OPTION value="15">15</OPTION> 
          <OPTION value="16">16</OPTION> 
          <OPTION value="17">17</OPTION> 
          <OPTION value="18">18</OPTION> 
          <OPTION value="19">19</OPTION> 
          <OPTION value="20">20</OPTION> 
          <OPTION value="21">21</OPTION> 
          <OPTION value="22">22</OPTION> 
          <OPTION value="23">23</OPTION> 
          <OPTION value="24">24</OPTION> 
          <OPTION value="25">25</OPTION> 
          <OPTION value="26">26</OPTION> 
          <OPTION value="27">27</OPTION> 
          <OPTION value="28">28</OPTION> 
          <OPTION value="29">29</OPTION> 
          <OPTION value="30">30</OPTION> 
          <OPTION value="31">31</OPTION> 
        </SELECT><SELECT name=cmonth size=1> 
          <OPTION selected value="00">MM</OPTION> 
          <OPTION  value="01">Jan</OPTION> 
          <OPTION value="02">Feb</OPTION> 
          <OPTION value="03">Mar</OPTION> 
          <OPTION value="04">Apr</OPTION> 
          <OPTION value="05">May</OPTION> 
          <OPTION value="06">Jun</OPTION> 
          <OPTION value="07">Jul</OPTION> 
          <OPTION value="08">Aug</OPTION> 
          <OPTION value="09">Sep</OPTION> 
          <OPTION value="10">Oct</OPTION> 
          <OPTION value="11">Nov</OPTION> 
          <OPTION value="12">Dec</OPTION> 
        </SELECT><SELECT name=cyear size=1 > 
          <OPTION selected value="0000">YYYY</OPTION> 
          <OPTION value="1901">1901</OPTION> 
          <OPTION value="1902">1902</OPTION> 
          <OPTION value="1903">1903</OPTION> 
          <OPTION value="1904">1904</OPTION> 
          <OPTION value="1905">1905</OPTION> 
          <OPTION value="1906">1906</OPTION> 
          <OPTION value="1907">1907</OPTION> 
          <OPTION value="1908">1908</OPTION> 
          <OPTION value="1909">1909</OPTION> 
          <OPTION value="1910">1910</OPTION> 
          <OPTION value="1911">1911</OPTION> 
          <OPTION value="1912">1912</OPTION> 
          <OPTION value="1913">1913</OPTION> 
          <OPTION value="1914">1914</OPTION> 
          <OPTION value="1915">1915</OPTION> 
          <OPTION value="1916">1916</OPTION> 
          <OPTION value="1917">1917</OPTION> 
          <OPTION value="1918">1918</OPTION> 
          <OPTION value="1919">1919</OPTION> 
          <OPTION value="1920">1920</OPTION> 
          <OPTION value="1921">1921</OPTION> 
          <OPTION value="1922">1922</OPTION> 
          <OPTION value="1923">1923</OPTION> 
          <OPTION value="1924">1924</OPTION> 
          <OPTION value="1925">1925</OPTION> 
          <OPTION value="1926">1926</OPTION> 
          <OPTION value="1927">1927</OPTION> 
          <OPTION value="1928">1928</OPTION> 
          <OPTION value="1929">1929</OPTION> 
          <OPTION value="1930">1930</OPTION> 
          <OPTION value="1931">1931</OPTION> 
          <OPTION value="1932">1932</OPTION> 
          <OPTION value="1933">1933</OPTION> 
          <OPTION value="1934">1934</OPTION> 
          <OPTION value="1935">1935</OPTION> 
          <OPTION value="1936">1936</OPTION> 
          <OPTION value="1937">1937</OPTION> 
          <OPTION value="1938">1938</OPTION> 
          <OPTION value="1939">1939</OPTION> 
          <OPTION value="1940">1940</OPTION> 
          <OPTION value="1941">1941</OPTION> 
          <OPTION value="1942">1942</OPTION> 
          <OPTION value="1943">1943</OPTION> 
          <OPTION value="1944">1944</OPTION> 
          <OPTION value="1945">1945</OPTION> 
          <OPTION value="1946">1946</OPTION> 
          <OPTION value="1947">1947</OPTION> 
          <OPTION value="1948">1948</OPTION> 
          <OPTION value="1949">1949</OPTION> 
          <OPTION value="1950">1950</OPTION> 
          <OPTION value="1951">1951</OPTION> 
          <OPTION value="1952">1952</OPTION> 
          <OPTION value="1953">1953</OPTION> 
          <OPTION value="1954">1954</OPTION> 
          <OPTION value="1955">1955</OPTION> 
          <OPTION value="1956">1956</OPTION> 
          <OPTION value="1957">1957</OPTION> 
          <OPTION value="1958">1958</OPTION> 
          <OPTION value="1959">1959</OPTION> 
          <OPTION value="1960">1960</OPTION> 
          <OPTION value="1961">1961</OPTION> 
          <OPTION value="1962">1962</OPTION> 
          <OPTION value="1963">1963</OPTION> 
          <OPTION value="1964">1964</OPTION> 
          <OPTION value="1965">1965</OPTION> 
          <OPTION value="1966">1966</OPTION> 
          <OPTION value="1967">1967</OPTION> 
          <OPTION value="1968">1968</OPTION> 
          <OPTION value="1969">1969</OPTION> 
          <OPTION value="1970">1970</OPTION> 
          <OPTION value="1971">1971</OPTION> 
          <OPTION value="1972">1972</OPTION> 
          <OPTION value="1973">1973</OPTION> 
          <OPTION value="1974">1974</OPTION> 
          <OPTION value="1975">1975</OPTION> 
          <OPTION value="1976">1976</OPTION> 
          <OPTION value="1977">1977</OPTION> 
          <OPTION value="1978">1978</OPTION> 
          <OPTION value="1979">1979</OPTION> 
          <OPTION value="1980">1980</OPTION> 
          <OPTION value="1981">1981</OPTION> 
          <OPTION value="1982">1982</OPTION> 
          <OPTION value="1983">1983</OPTION> 
          <OPTION value="1984">1984</OPTION> 
          <OPTION value="1985">1985</OPTION> 
          <OPTION value="1986">1986</OPTION> 
          <OPTION value="1987">1987</OPTION> 
          <OPTION value="1988">1988</OPTION> 
          <OPTION value="1989">1989</OPTION> 
          <OPTION value="1990">1990</OPTION> 
          <OPTION value="1991">1991</OPTION> 
          <OPTION value="1992">1992</OPTION> 
          <OPTION value="1993">1993</OPTION> 
          <OPTION value="1994">1994</OPTION> 
          <OPTION value="1995">1995</OPTION> 
          <OPTION value="1996">1996</OPTION> 
          <OPTION value="1997">1997</OPTION> 
          <OPTION value="1998">1998</OPTION> 
          <OPTION value="1999">1999</OPTION> 
          <OPTION value="2000">2000</OPTION> 
          <OPTION value="2001">2001</OPTION> 
          <OPTION value="2002">2002</OPTION> 
          <OPTION value="2003">2003</OPTION> 
          <OPTION value="2004">2004</OPTION> 
          <OPTION value="2005">2005</OPTION> 
          <OPTION value="2006">2006</OPTION> 
          <OPTION value="2007">2007</OPTION> 
          <OPTION value="2008">2008</OPTION> 
          
        </SELECT> 
        <span ><sup><font color="red"> *</font></sup></span></td> </tr>   
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    
       <tr><td>           Address	 </td><td> <textarea  type=text name="address" ></textarea> </td>  
       
       <td>Witness Record Statement</td><td> <textarea type=text  name="witnessrecordstmt" ></textarea></td> </tr>
      
  
       <tr><td>    Hearing ID	 </td><td> <select name="hearingid" >
       <option value="select">-Select-</option>
       <% CoreHash ch7=new CaseHearingDAO().getCaseHearingID();
         Enumeration em7=ch7.elements();
          CaseHearingModel casehearingmodel=null;
         while(em7.hasMoreElements()){
             casehearingmodel=(CaseHearingModel)em7.nextElement();
         %>
         <option value="<%=casehearingmodel.getCasehearingid() %>"><%=casehearingmodel.getCasehearingid() %></option> 
         <%  }  %> 
       </select> </td>  
       
       <td>Hearing Result</td><td> <textarea type=text  name="hearingresult" ></textarea></td> </tr>
        <tr><td>  Next Hearing Date<SELECT name=nday size=1 > 
          <OPTION selected value="00">DD</OPTION> 
          <OPTION  value="01">01</OPTION> 
          <OPTION value="02">02</OPTION> 
          <OPTION value="03">03</OPTION> 
          <OPTION value="04">04</OPTION> 
          <OPTION value="05">05</OPTION> 
          <OPTION value="06">06</OPTION> 
          <OPTION value="07">07</OPTION> 
          <OPTION value="08">08</OPTION> 
          <OPTION value="09">09</OPTION> 
          <OPTION value="10">10</OPTION> 
          <OPTION value="11">11</OPTION> 
          <OPTION value="12">12</OPTION> 
          <OPTION value="13">13</OPTION> 
          <OPTION value="14">14</OPTION> 
          <OPTION value="15">15</OPTION> 
          <OPTION value="16">16</OPTION> 
          <OPTION value="17">17</OPTION> 
          <OPTION value="18">18</OPTION> 
          <OPTION value="19">19</OPTION> 
          <OPTION value="20">20</OPTION> 
          <OPTION value="21">21</OPTION> 
          <OPTION value="22">22</OPTION> 
          <OPTION value="23">23</OPTION> 
          <OPTION value="24">24</OPTION> 
          <OPTION value="25">25</OPTION> 
          <OPTION value="26">26</OPTION> 
          <OPTION value="27">27</OPTION> 
          <OPTION value="28">28</OPTION> 
          <OPTION value="29">29</OPTION> 
          <OPTION value="30">30</OPTION> 
          <OPTION value="31">31</OPTION> 
        </SELECT><SELECT name=nmonth size=1> 
          <OPTION selected value="00">MM</OPTION> 
          <OPTION  value="01">Jan</OPTION> 
          <OPTION value="02">Feb</OPTION> 
          <OPTION value="03">Mar</OPTION> 
          <OPTION value="04">Apr</OPTION> 
          <OPTION value="05">May</OPTION> 
          <OPTION value="06">Jun</OPTION> 
          <OPTION value="07">Jul</OPTION> 
          <OPTION value="08">Aug</OPTION> 
          <OPTION value="09">Sep</OPTION> 
          <OPTION value="10">Oct</OPTION> 
          <OPTION value="11">Nov</OPTION> 
          <OPTION value="12">Dec</OPTION> 
        </SELECT><SELECT name=nyear size=1 > 
          <OPTION selected value="0000">YYYY</OPTION> 
          <OPTION value="2001">2001</OPTION> 
          <OPTION value="2002">2002</OPTION> 
          <OPTION value="2003">2003</OPTION> 
          <OPTION value="2004">2004</OPTION> 
          <OPTION value="2005">2005</OPTION> 
          <OPTION value="2006">2006</OPTION> 
          <OPTION value="2007">2007</OPTION> 
          <OPTION value="2008">2008</OPTION> 
          <OPTION value="2009">2009</OPTION> 
          <OPTION value="2010">2010</OPTION> 
          <OPTION value="2011">2011</OPTION> 
          <OPTION value="2012">2012</OPTION> 
          <OPTION value="2013">2013</OPTION> 
          <OPTION value="2014">2014</OPTION> 
          <OPTION value="2015">2015</OPTION> 
          <OPTION value="2016">2016</OPTION> 
          <OPTION value="2017">2017</OPTION> 
          <OPTION value="2018">2018</OPTION> 
          <OPTION value="2020">2020</OPTION> 
          <OPTION value="2020">2020</OPTION> 
          <OPTION value="2021">2021</OPTION> 
          <OPTION value="2022">2022</OPTION> 
          <OPTION value="2023">2023</OPTION> 
          <OPTION value="2024">2024</OPTION> 
          <OPTION value="2025">2025</OPTION> 
          <OPTION value="2026">2026</OPTION> 
          <OPTION value="2027">2027</OPTION> 
          <OPTION value="2028">2028</OPTION> 
          <OPTION value="2029">2029</OPTION> 
          <OPTION value="2030">2030</OPTION> 
          <OPTION value="2031">2031</OPTION> 
          <OPTION value="2032">2032</OPTION> 
          <OPTION value="2033">2033</OPTION> 
          <OPTION value="2034">2034</OPTION> 
          <OPTION value="2035">2035</OPTION> 
          <OPTION value="2036">2036</OPTION> 
          <OPTION value="2037">2037</OPTION> 
          <OPTION value="2038">2038</OPTION> 
          <OPTION value="2039">2039</OPTION> 
          <OPTION value="2040">2040</OPTION> 
           
          
        </SELECT> </td>&nbsp;
        
      
 <td>Any Special Instruction</td><td> <textarea type=text  name="anyinstruction" ></textarea></td> </tr>
  <tr><td>Section ID </td><td>      
         <select name="sectionid"> 
         <option value="select">-Select-</option>
      <% CoreHash ch4=new SectionDAO().getAllSections();
         Enumeration em4=ch4.elements();
          SectionModel  sectionmodel=null;
         while(em4.hasMoreElements()){
             sectionmodel=(SectionModel)em4.nextElement();
            System.out.println("secid in add reg "+sectionmodel.getSectionid());
         %><option value="<%=sectionmodel.getSectionid() %>"><%=sectionmodel.getSectionid() %></option>
          <%  } %> </select> </td></tr>
       <tr align=center><td></td><td>   <input type="submit" name="submit" value="Update"/>  
         <input type="reset" name="reset" value="Clear" /></td> </tr>
      </table></td></tr></table>
</form>
<script>

var frmvalidator  = new Validator("updatecaseregistration");

  frmvalidator.addValidation("caseno","req","Please Enter Case Number");  
  frmvalidator.addValidation("casetypename","dontselect=0");
  frmvalidator.addValidation("clientname","dontselect=0");  
  frmvalidator.addValidation("nexthearingdate","req","Please Enter Next Hearing Date");
  frmvalidator.addValidation("courtname","dontselect=0");
  frmvalidator.addValidation("lawyername","dontselect=0"); 
  
  frmvalidator.addValidation("sectionid","req","Please Enter SectionID");
  
  frmvalidator.addValidation("lawyeracceptdate","req","Please Enter Lawyer Accept Date");
   frmvalidator.addValidation("lawyeractivestate","dontselect=0");
   
    
   frmvalidator.addValidation("evidenceregdate","req","Please Enter Evidence Reg Date");
   frmvalidator.addValidation("evidencetypename","dontselect=0");   
    frmvalidator.addValidation("evidencetypedesc","req","Please Enter Evidence Description"); 
     frmvalidator.addValidation("evidenceimage","req","Please Enter Evidence Image "); 
      frmvalidator.addValidation("evidencevedio","req","Please Enter Evidence Vedio"); 
       frmvalidator.addValidation("evidenceaudio","req","Please Enter Evidence Audio"); 
       
       
  
  frmvalidator.addValidation("memberfstname","req","Please Enter Member name");
  frmvalidator.addValidation("membertype","dontselect=0");
  
  frmvalidator.addValidation("sequenceno","req","Please Enter Sequence Number");
  frmvalidator.addValidation("memberffstname","req","Please Enter Member Father Name");
  frmvalidator.addValidation("memaddress","req","Please Enter Member Address");
  
  frmvalidator.addValidation("witnessfstname","req","Please Enter Witness Name");
  frmvalidator.addValidation("witnesstype","dontselect=0");
  frmvalidator.addValidation("witnessseqno","req","Please Enter Witness Sequence Number");
  frmvalidator.addValidation("address","req","Please Enter Address");
  frmvalidator.addValidation("witnessrecordstmt","req","Please Enter Witness Record Statement");
  frmvalidator.addValidation("hearingresult","req","Please Enter Next Hearing Result");
  frmvalidator.addValidation("hearingid","dontselect=0");
   frmvalidator.addValidation("anyinstruction","dontselect=0");
  
  
</script>
          </td>
        <td width="5%">&nbsp;</td>
      </tr>
    </table></td>
    <td width="3">&nbsp;</td>
  </tr>
  <tr>
    <td height="25" colspan="2" bgcolor="#0D4961"><span class="style1">&copy;All rights reserved</span></td>
  </tr>
</table>
</body>
</html>
