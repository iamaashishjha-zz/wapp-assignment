using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wapp
{
    public partial class index1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] != null)
            {
                Response.Redirect("~/home1.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login-auth.aspx");
        }
    }
}