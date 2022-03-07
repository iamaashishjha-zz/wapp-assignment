using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace wapp.WebPages.Frontend
{
    public partial class contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            string name = txtName.Text;
            string email = txtEmail.Text;
            string subject = txtSubject.Text;
            string message = txtMessage.Text;
            DateTime date = DateTime.Now;

            string query = "INSERT INTO tblFeedback VALUES(@name, @email, @subject, @message, @created_at)";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@subject", subject);
            cmd.Parameters.AddWithValue("@message", message);
            cmd.Parameters.AddWithValue("@created_at", date.ToString());

            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            txtName.Text = null;
            txtEmail.Text = null;
            txtSubject.Text = null;
            txtMessage.Text = null;

            Response.Redirect("~/index.aspx");
        }
    }
}