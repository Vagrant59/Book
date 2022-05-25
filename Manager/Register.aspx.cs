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
    public partial class Register : System.Web.UI.Page
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
            String strLoginName = txtName.Text;
            //访问数据库Newsuser表，注册信息
            //第一步建立连接对象conn
            SqlConnection conn = new SqlConnection(connStr);
            //设置SQL查询语句
            string sql = "insert into [Newsuser](UserID,UserPassword,UserName) values('" + strLoginID + "','" + strLoginPwd + "','" + strLoginName +"')";
            //创建sqlCommand对象
            SqlCommand cmd = new SqlCommand();
            //打开conn连接对象
            conn.Open();
            if(check(strLoginID, cmd))
            {
                cmd.Connection = conn;
                cmd.CommandText = sql;
                //建dr存储ExecuteNonQuery结果，用于判断SQL语句执行的结果
                int dr = cmd.ExecuteNonQuery();
                if (dr > 0) //如果有数据，则dr.Read()为true
                {
                    //注册成功
                    Response.Write("<script>alert('注册成功！')；</script>");
                    //注册成功后跳转
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    //alert()弹窗函数
                    Response.Write("<script>alert('注册失败！');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('用户名已存在！');</script>");
            }
            
        }
        protected bool check(string u, SqlCommand cmd)
        {
            //建立连接对象conn
            SqlConnection conn1 = new SqlConnection(connStr);
            //设置SQL查询语句
            string sql1 = "select * from Newsuser where UserID='" + u + "'";
            //打开conn连接对象
            conn1.Open();
            cmd.Connection = conn1;
            cmd.CommandText = sql1;
            //利用SqlCommand对象，创建SqlDataReader对象，用于判断SQL语句执行的结果
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read()) //如果有数据，则dr.Read()为true
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}