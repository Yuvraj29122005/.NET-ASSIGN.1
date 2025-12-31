<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    // Server-side C# logic to handle temperature conversion
    protected void ConvertButton_Click(object sender, EventArgs e)
    {
        // Validate input
        if (double.TryParse(TempInput.Text, out double inputTemp))
        {
            double result = 0;
            string symbol = "";

            // Check selected conversion type
            if (ConversionType.SelectedValue == "CtoF")
            {
                // Celsius to Fahrenheit
                result = (inputTemp * 9 / 5) + 32;
                symbol = "°F";
            }
            else
            {
                // Fahrenheit to Celsius
                result = (inputTemp - 32) * 5 / 9;
                symbol = "°C";
            }

            ResultLabel.Text = "Result: " + result.ToString("F2") + " " + symbol;
            ResultLabel.ForeColor = System.Drawing.Color.Black;
            ResultLabel.Visible = true;
        }
        else
        {
            // Error handling for non-numeric input
            ResultLabel.Text = "Please enter a valid number.";
            ResultLabel.ForeColor = System.Drawing.Color.Red;
            ResultLabel.Visible = true;
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Temperature Converter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Temperature Converter</h1>
            
            <div>
                <label for="TempInput">Enter Temperature:</label>
                <!-- ASP.NET TextBox Control -->
                <asp:TextBox ID="TempInput" runat="server"></asp:TextBox>
            </div>
            <br />
            <div>
                <label for="ConversionType">Convert To:</label>
                <!-- ASP.NET DropDownList Control -->
                <asp:DropDownList ID="ConversionType" runat="server">
                    <asp:ListItem Value="CtoF">Fahrenheit (°F)</asp:ListItem>
                    <asp:ListItem Value="FtoC">Celsius (°C)</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <!-- ASP.NET Button Control -->
            <asp:Button ID="ConvertButton" runat="server" Text="Convert" OnClick="ConvertButton_Click" />
            <br /><br />
            <div>
                <!-- ASP.NET Label Control for output -->
                <asp:Label ID="ResultLabel" runat="server" Visible="false" Font-Bold="true"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>