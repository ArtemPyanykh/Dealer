(* ::Package:: *)

BeginPackage["Dealer`"]
NashEquilibrium::usage = "nashEquilibrium[\*StyleBox[\"matrix\", FontSlant->Italic]] finds value and mixed strategies of players for zero-sum game with given \*StyleBox[\"matrix\", FontSlant->Italic]."

Begin["`Private`"]
regularize[matrix_] := Module[{regConstant},
regConstant = Abs[Min //@ matrix] + 1;
{matrix + regConstant, regConstant}
]

playerOneAuxProblem[matrix_] := Module[{rows, cols, coeff, consMatrix, consVector},
{rows, cols} = Dimensions[matrix];
{coeff, consMatrix, consVector} = {Table[1, {rows}], Transpose[matrix], Table[1, {cols}]};
{coeff, consMatrix, consVector}
]

playerTwoAuxProblem[matrix_] := Module[{rows, cols, coeff, consMatrix, consVector},
{rows, cols} = Dimensions[matrix];
{coeff, consMatrix, consVector} = {Table[-1, {cols}], -matrix, Table[-1, {rows}]};
{coeff, consMatrix, consVector}
]

solveAuxProblem[problem_] := Module[{value, auxMixedStrategy,mixedStrategy},
auxMixedStrategy = LinearProgramming @@ problem;
value = 1/Total[auxMixedStrategy];
mixedStrategy = value*auxMixedStrategy;
{value, mixedStrategy}
]

NashEquilibrium[matrix_] := Module[{regMatrix, regConstant, preValue, value, playerOneStrategy, playerTwoStrategy, dummy},
{regMatrix, regConstant} = regularize[matrix];
{preValue, playerOneStrategy} = solveAuxProblem[playerOneAuxProblem[regMatrix]];
{dummy, playerTwoStrategy} = solveAuxProblem[playerTwoAuxProblem[regMatrix]];
value = preValue - regConstant;
{value, playerOneStrategy, playerTwoStrategy}
]
End[]
EndPackage[]









