using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Myweb.Manager
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        public string connStr = ConfigurationManager.ConnectionStrings["NewsConnectionString"].ConnectionString;
        protected void Button1_Click(object sender, EventArgs e)
        {
            //获取登录名和密码信息
            String strLoginID = txtAdmin.Text;
            String strLoginPwd = txtPwd.Text;
            //访问数据库Newsuser表，验证登录账号
            //第一步建立连接对象conn
            SqlConnection conn = new SqlConnection(connStr);
            //设置SQL查询语句
            string sql = "select * from Newsuser where UserID='" + strLoginID + "' and UserPassword='" + strLoginPwd + "'";
            //创建sqlCommand对象
            SqlCommand cmd = new SqlCommand(sql, conn);
            //打开conn连接对象
            conn.Open();
            //利用SqlCommand对象，创建SqlDataReader对象，用于判断SQL语句执行的结果
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read()) //如果有数据，则dr.Read()为true
            {
                //登录验证成功
                //赋Session["Login"]值用于判断是否正常登录
                Session["LoginXX"] = "ok";
                Session["UserID"] = dr["UserID"].ToString();//获取匹配记录的用户名
                //登录成功后跳转
                Response.Redirect("~/Manager/EditNews.aspx");
            }
            else
            {
                //alert()弹窗函数
                Response.Write("<script>alert('用户名或密码错误，请重新输入！');</script>");
            }
        }
    }
}