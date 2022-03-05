using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace wapp
{
    public partial class stuDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
        SqlDataAdapter adapt;
        DataTable dt;
        DataTable dt2;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["user_id"] != null) && (Session["user_sub_role"].ToString() == "Student"))
            {
                string user_id = Session["user_id"].ToString();
                if (!IsPostBack)
                {
                    string emailcheckquery = "select * from tblUsers where id='" + user_id + "'";
                    SqlCommand emailcheckcmd = new SqlCommand(emailcheckquery, con);
                    con.Open();

                    SqlDataReader sdr = emailcheckcmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        string sname = (string)sdr["name"];
                        string semail = (string)sdr["email"];
                        string saddress = (string)sdr["address"];
                        string spassword = (string)sdr["password"];

                        txtTName.Text = sname;
                        txtEmail.Text = semail;
                        txtAddress.Text = saddress;
                        txtPassword.Text = spassword;
                    }
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("~/home.aspx");
            }
        }

        protected void btnUpdateInfo_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            string ssname = txtTName.Text;
            string ssemail = txtEmail.Text;
            string ssaddress = txtAddress.Text;
            string sspassword = txtPassword.Text;
            int ssuser_id = (int)Session["user_id"];

         
            SqlCommand cmd = new SqlCommand("Update tblUsers set name='" + ssname + "',email='" + ssemail + "',address='" + ssaddress + "',password='" + sspassword + "' where ID=" + ssuser_id, con);
            con.Open();

            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();

            txtTName.Text = null;
            txtEmail.Text = null;
            txtAddress.Text = null;
            txtPassword.Text = null;
        }
    }
}