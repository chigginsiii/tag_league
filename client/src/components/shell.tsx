import React, { ReactNode } from "react";
import styled from "@emotion/styled";
import colors from "./style/colors";

const ShellOuter = styled.div({
  position: "absolute",
  margin: 0,
  padding: 0,
  top: 0,
  bottom: 0,
  left: 0,
  right: 0,
  backgroundColor: colors.primary.bright,
  display: "flex",
  flexDirection: "row",
  justifyItems: "stretch"
});

const ShellMain = styled.div({
  flexGrow: 1,
  display: "block",
  height: "auto",
  boxSizing: "border-box"
});

interface ShellProps {
  children: ReactNode;
}

const Shell = ({ children }: ShellProps) => (
  <ShellOuter>
    <ShellMain>{children}</ShellMain>
  </ShellOuter>
);

export default Shell;
