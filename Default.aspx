<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    // Server-side C# logic to handle the button click
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        // Check if the input is not empty
        if (!string.IsNullOrWhiteSpace(NameInput.Text))
        {
            // Construct the welcome message
            // Server.HtmlEncode is used to prevent Cross-Site Scripting (XSS)
            MessageLabel.Text = "Welcome to webpage, " + Server.HtmlEncode(NameInput.Text) + "!";
            MessageLabel.ForeColor = System.Drawing.Color.Green;
            MessageLabel.Visible = true;
        }
        else
        {
            // Error message if input is empty
            MessageLabel.Text = "Please enter your name first.";
            MessageLabel.ForeColor = System.Drawing.Color.Red;
            MessageLabel.Visible = true
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            
            <div>
                <label for="NameInput">What is your name?</label>
                <!-- ASP.NET TextBox Control -->
                <asp:TextBox ID="NameInput" runat="server" placeholder="e.g. John Doe"></asp:TextBox>
            </div>
            <br />
            <!-- ASP.NET Button Control -->
            <asp:Button ID="SubmitButton" runat="server" Text="Say Hello" OnClick="SubmitButton_Click" />
            <br /><br />
            <div>
                <!-- ASP.NET Label Control for output -->
                <asp:Label ID="MessageLabel" runat="server" Visible="false"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>