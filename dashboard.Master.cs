using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wapp
{
    public partial class dashboard : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String activepage = Request.RawUrl;
            if (activepage.Contains("teachDashboard.aspx"))
            {
                updateTeachInfo.Attributes.Add("class", "is-active");
            }
            else if (activepage.Contains("courseDashboard.aspx"))
            {
                allCourses.Attributes.Add("class", "is-active");
            }
            else if (activepage.Contains("courseDashboard.aspx"))
            {
                adminAllCourses.Attributes.Add("class", "is-active");
            }
            else if (activepage.Contains("teachStudent.aspx"))
            {
                teachIndCourses.Attributes.Add("class", "is-active");
            }
            else if (activepage.Contains("stuDashboard.aspx"))
            {
                updateStudentInfo.Attributes.Add("class", "is-active");
            }
            else if (activepage.Contains("stuCourses.aspx"))
            {
                stuCourses.Attributes.Add("class", "is-active");
            }
            else if (activepage.Contains("feedBackDashboard.aspx"))
            {
                adminFeedback.Attributes.Add("class", "is-active");
            }
            else if (activepage.Contains("userDashboard.aspx"))
            {
                adminUser.Attributes.Add("class", "is-active");
            }
            else if (activepage.Contains("studentCourse.aspx"))
            {
                adminStudents.Attributes.Add("class", "is-active");
            }
            
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Remove("user_id");
            Session.Remove("user_email");
            Response.Redirect("~/index.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/home.aspx");
        }
    }
}