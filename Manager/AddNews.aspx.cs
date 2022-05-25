using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Myweb.NewsAppCode;

namespace Myweb.Manager
{
    public partial class AddNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //初始化新闻操作类
            NewsManager mynews = new NewsManager();
            //调用添加新闻的方法
            bool result = mynews.AddNews(txttitle.Text, txtcontent.Text, ddlcategory.SelectedValue, txtimageurl.Text);
            //判断添加操作的执行结果
            if (result)
                //成功后返回首页
                Response.Redirect("~/Default.aspx");
        }
    }
}