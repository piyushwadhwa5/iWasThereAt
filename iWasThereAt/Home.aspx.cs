using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twitterizer;

public partial class Home : System.Web.UI.Page
{
    string clid = System.Configuration.ConfigurationManager.AppSettings["cid"];
    string clsec = System.Configuration.ConfigurationManager.AppSettings["csec"];
    string cba = "http://127.0.0.1:3065/iWasThereAt/redirect.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            OAuthTokenResponse authtoken = OAuthUtility.GetRequestToken(clid, clsec, cba);
            Response.Redirect(string.Format("http://twitter.com/oauth/authorize?oauth_token={0}", authtoken.Token), true);
        }
        catch
        {
        }
    }
}