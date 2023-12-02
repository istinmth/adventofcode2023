Imports System.IO
Imports System.Linq

Module Module1
    Sub Main()
        Dim total As Integer = 0
        Dim wordDict As New Dictionary(Of String, String) From {
            {"one", "onee"},
            {"two", "twoo"},
            {"three", "three"},
            {"four", "fourr"},
            {"five", "fivee"},
            {"six", "sixx"},
            {"seven", "sevenn"},
            {"eight", "eightt"},
            {"nine", "ninee"}
        }

        Dim wordNumDict As New Dictionary(Of String, String) From {
            {"one", "1"},
            {"two", "2"},
            {"thre", "3"},
            {"four", "4"},
            {"five", "5"},
            {"six", "6"},
            {"seven", "7"},
            {"eight", "8"},
            {"nine", "9"}
        }

        Dim lines As String() = File.ReadAllLines("input.txt")
        For Each line As String In lines
            Dim newLine As String = line
            For Each pair As KeyValuePair(Of String, String) In wordDict
                newLine = newLine.Replace(pair.Key, pair.Value)
            Next
            For Each pair As KeyValuePair(Of String, String) In wordNumDict
                newLine = newLine.Replace(pair.Key, pair.Value)
            Next
            If Not String.IsNullOrEmpty(newLine) Then
                Dim firstDigit As Char = newLine.FirstOrDefault(AddressOf Char.IsDigit)
                Dim lastDigit As Char = newLine.LastOrDefault(AddressOf Char.IsDigit)
                total += Integer.Parse(firstDigit.ToString()) + Integer.Parse(lastDigit.ToString())
            End If
        Next

        Console.WriteLine(total)
    End Sub
End Module