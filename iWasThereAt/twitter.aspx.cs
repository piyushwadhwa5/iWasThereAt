using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twitterizer;

public partial class twitter : System.Web.UI.Page
{
    string clid = System.Configuration.ConfigurationManager.AppSettings["cid"];
    string clsec = System.Configuration.ConfigurationManager.AppSettings["csec"];
    double lat;
    double lng;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        try
        {
            if (!(TextBox1.Text == "" || TextBox1.Text == null))
            {
                OAuthTokens token = new OAuthTokens();
                token.AccessToken = Session["tokenS"].ToString();
                token.AccessTokenSecret = Session["Atoken"].ToString();
                token.ConsumerKey = clid;
                token.ConsumerSecret = clsec;
                lat = double.Parse(HiddenField1.Value);
                lng = double.Parse(HiddenField2.Value);
                StatusUpdateOptions sou = new StatusUpdateOptions();
                sou.Latitude = lat;
                sou.Longitude = lng;
                TwitterPlaceLookupOptions tplo = new TwitterPlaceLookupOptions();
                tplo.MaxResults = 1;

                TwitterResponse<TwitterPlaceCollection> tc = TwitterPlace.Lookup(lat, lng, tplo);
                if (tc.Result == RequestResult.Success)
                {
                    foreach (var s in tc.ResponseObject)
                    {
                        sou.PlaceId = s.Id;
                    }
                }
                TwitterResponse<TwitterStatus> tweetstatus = TwitterStatus.Update(token, TextBox1.Text, sou);
                if (tweetstatus.Result == RequestResult.Success)
                {
                    Label6.Text = "Your message was posted successfully";

                }
                else
                {
                    Label6.Text = "Something went Wrong, Your Tweet wasn't Updated";
                }
            }
            else
            {
            }
        }
        catch
        {
            Label6.Text = "Tweet Update Failed, Please Try Again";
        }
    }
}