using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wapp
{
    public partial class home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user_id"] != null)
            {
                string user_id = "User Id is : " + Session["user_id"];
                Response.Write(user_id);
            }
            else if (Session["user_id"] == null)
            {
                Response.Redirect("~/login-auth.aspx");
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("user_id");
            Session.Remove("user_email");
            Response.Redirect("~/index1.aspx");
        }
    }
}