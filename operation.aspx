<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    // Server-side C# logic to handle algebraic operations
    protected void CalculateButton_Click(object sender, EventArgs e)
    {
        // Validate inputs
        if (double.TryParse(Num1Input.Text, out double n1) && double.TryParse(Num2Input.Text, out double n2))
        {
            double result = 0;
            string op = OperationList.SelectedValue;
            bool error = false;

            // Perform selected operation
            switch (op)
            {
                case "Add":
                    result = n1 + n2;
                    break;
                case "Subtract":
                    result = n1 - n2;
                    break;
                case "Multiply":
                    result = n1 * n2;
                    break;
                case "Divide":
                    if (n2 != 0)
                    {
                        result = n1 / n2;
                    }
                    else
                    {
                        ResultLabel.Text = "Error: Cannot divide by zero.";
                        ResultLabel.ForeColor = System.Drawing.Color.Red;
                        ResultLabel.Visible = true;
                        error = true;
                    }
                    break;
            }

            if (!error)
            {
                ResultLabel.Text = "Result: " + result.ToString("F2");
                ResultLabel.ForeColor = System.Drawing.Color.Black;
                ResultLabel.Visible = true;
            }
        }
        else
        {
            // Error handling for non-numeric input
            ResultLabel.Text = "Please enter valid numbers.";
            ResultLabel.ForeColor = System.Drawing.Color.Red;
            ResultLabel.Visible = true;
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Algebraic Calculator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Algebraic Calculator</h1>
            
            <div>
                <label for="Num1Input">First Number:</label>
                <!-- ASP.NET TextBox Control -->
                <asp:TextBox ID="Num1Input" runat="server"></asp:TextBox>
            </div>
            <br />
            
            <div>
                <label for="OperationList">Operation:</label>
                <!-- ASP.NET DropDownList Control -->
                <asp:DropDownList ID="OperationList" runat="server">
                    <asp:ListItem Value="Add">Add (+)</asp:ListItem>
                    <asp:ListItem Value="Subtract">Subtract (-)</asp:ListItem>
                    <asp:ListItem Value="Multiply">Multiply (*)</asp:ListItem>
                    <asp:ListItem Value="Divide">Divide (/)</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />

            <div>
                <label for="Num2Input">Second Number:</label>
                <!-- ASP.NET TextBox Control -->
                <asp:TextBox ID="Num2Input" runat="server"></asp:TextBox>
            </div>
            <br />

            <!-- ASP.NET Button Control -->
            <asp:Button ID="CalculateButton" runat="server" Text="Calculate" OnClick="CalculateButton_Click" />
            <br /><br />
            
            <div>
                <!-- ASP.NET Label Control for output -->
                <asp:Label ID="ResultLabel" runat="server" Visible="false" Font-Bold="true"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>