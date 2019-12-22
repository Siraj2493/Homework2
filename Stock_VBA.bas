Attribute VB_Name = "Module1"
Sub Stocks_HW2()

Dim Current As Worksheet


For Each ws In Worksheets
    Dim Last_row As Long
    Dim ColumnA As String
    Dim summary_ColumnA As String
    Dim totalstock As Double
    Dim Close_Price As Double
    Dim Open_Price As Double
    Dim Variance As Double
    Dim vMin, vMax
    Dim NumRow As Long
    summary_ColumnA = 2


    ws.Range("i1").Value = "Ticker"
    ws.Range("j1").Value = "Change_Yearly"
    ws.Range("k1").Value = "Year_Percnt_change"
    ws.Range("l1").Value = "Total Stock Volume"
    Last_row = ws.Cells(Rows.Count, "A").End(xlUp).Row
    Open_Price = ws.Cells(summary_ColumnA, 3).Value
    For i = 2 To Last_row
                     If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                            ColumnA = ws.Cells(i, 1).Value
                            Close_Price = ws.Cells(i, 6).Value
                            totalstock = totalstock + ws.Cells(i, 7).Value
                            Yearly_change = Close_Price - Open_Price
                            ' Calculate overall year percentage
                If Open_Price <> 0 And Close_Price <> 0 Then
                    Percentage = Close_Price / Open_Price
                    ws.Range("k" & summary_ColumnA) = Percentage
                                     ws.Range("k" & summary_ColumnA).NumberFormat = "0.00%"
                Else
                    overallYearChangePercent = 0
                End If
                                ws.Range("j" & summary_ColumnA).Value = Yearly_change
                                If Yearly_change < 0 Then
                                    ws.Range("j" & summary_ColumnA).Interior.Color = RGB(255, 0, 0)
                                Else
                                    ws.Range("j" & summary_ColumnA).Interior.Color = RGB(124, 252, 0)
                                End If
                            ws.Range("i" & summary_ColumnA).Value = ColumnA
                            ws.Range("l" & summary_ColumnA).Value = totalstock
    j = i + 1
    Open_Price = ws.Cells(j, 3).Value
                            summary_ColumnA = summary_ColumnA + 1
                            totalstock = 0
                Else
                    totalstock = totalstock + ws.Cells(i, 7).Value
          End If
     Next
Next
End Sub