<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            StatusLabel.Text = "Page Loaded. Interact with controls to see AutoPostBack.";
        }
    }

    // Triggered immediately when selection changes
    protected void ColorList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedColor = ColorList.SelectedValue;
        DemoPanel.BackColor = System.Drawing.Color.FromName(selectedColor);
        StatusLabel.Text = "DropDownList triggered PostBack. Color changed to " + selectedColor;
    }

    // Triggered immediately when checked/unchecked
    protected void VisibilityCheck_CheckedChanged(object sender, EventArgs e)
    {
        SecretLabel.Visible = VisibilityCheck.Checked;
        StatusLabel.Text = "CheckBox triggered PostBack. Visibility is now " + (VisibilityCheck.Checked ? "On" : "Off");
    }

    // Triggered immediately when text is changed and focus is lost (e.g., pressing Tab)
    protected void InputText_TextChanged(object sender, EventArgs e)
    {
        EchoLabel.Text = "You typed: " + InputText.Text.ToUpper();
        StatusLabel.Text = "TextBox triggered PostBack on blur.";
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AutoPostBack Demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>AutoPostBack Demonstration</h1>
            <p>When <strong>AutoPostBack="true"</strong>, the page submits to the server automatically upon interaction.</p>
            
            <hr />

            <h3>1. DropDownList</h3>
            <label>Select a Panel Color:</label>
            <!-- AutoPostBack causes the page to reload immediately on selection -->
            <asp:DropDownList ID="ColorList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ColorList_SelectedIndexChanged">
                <asp:ListItem Value="White">White</asp:ListItem>
                <asp:ListItem Value="Yellow">Yellow</asp:ListItem>
                <asp:ListItem Value="LightBlue">Light Blue</asp:ListItem>
                <asp:ListItem Value="LightGreen">Light Green</asp:ListItem>
            </asp:DropDownList>
            <br /><br />
            
            <asp:Panel ID="DemoPanel" runat="server" Height="50px" Width="300px" BorderStyle="Solid" BorderWidth="1px" BackColor="White">
                <div style="padding: 10px;">Watch my background color change!</div>
            </asp:Panel>

            <hr />

            <h3>2. CheckBox</h3>
            <!-- AutoPostBack causes immediate server update when checked -->
            <asp:CheckBox ID="VisibilityCheck" runat="server" Text="Show Secret Text" AutoPostBack="true" OnCheckedChanged="VisibilityCheck_CheckedChanged" />
            <br />
            <asp:Label ID="SecretLabel" runat="server" Text="Hidden Message Revealed!" Visible="false" ForeColor="Red" Font-Bold="true"></asp:Label>

            <hr />

            <h3>3. TextBox</h3>
            <label>Type text and press Tab (focus out):</label>
            <br />
            <!-- AutoPostBack triggers only after the control loses focus -->
            <asp:TextBox ID="InputText" runat="server" AutoPostBack="true" OnTextChanged="InputText_TextChanged"></asp:TextBox>
            <br />
            <asp:Label ID="EchoLabel" runat="server" ForeColor="Blue"></asp:Label>

            <hr />
            
            <p><strong>Server Status:</strong> <asp:Label ID="StatusLabel" runat="server"></asp:Label></p>
        </div>
    </form>
</body>
</html>