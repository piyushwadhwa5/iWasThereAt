using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twitterizer;

public partial class redirect : System.Web.UI.Page
{
    string clid = System.Configuration.ConfigurationManager.AppSettings["cid"];
    string clsec = System.Configuration.ConfigurationManager.AppSettings["csec"];
    protected void Page_Load(object sender, EventArgs e)
    {
        OAuthTokenResponse tokens = OAuthUtility.GetAccessTokenDuringCallback(clid, clsec);
        Session["tokenS"] = tokens.Token;
        Session["Atoken"] = tokens.TokenSecret;
        Session["sname"] = tokens.ScreenName;
        Session["uid"] = tokens.UserId;

        Response.Redirect("twitter.aspx");
    }
}