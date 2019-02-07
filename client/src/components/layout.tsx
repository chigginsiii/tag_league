import React, { ReactNode } from "react";
import styled from "@emotion/styled";
import { colors, text } from "./style"
import TextBox from "./style/textBox"

const LayoutWrapper = styled.div({
  height: "100%",
  display: "flex",
  flexDirection: "column",
  justifyContent: "flex-start",
  alignItems: "stretch"
});

const LayoutHeader = styled.div({
  flexGrow: 0,
  display: "flex",
  height: 60,
  justifyContent: "center",
  alignItems: "center"
});

const LayoutBody = styled.div({
  flexGrow: 1,
  height: "auto",
  boxModel: "border-box",
  backgroundColor: colors.primary.brighter,
  color: colors.primary.dark,
  padding: 4
});

const LayoutFooter = styled.div({
  flexGrow: 0,
  height: 40,
  display: "flex",
  padding: 4,
  width: "100%",
  alignItems: "center",
  justifyContent: "center"
});

interface LayoutProps {
  children: ReactNode
}

const Layout = ({ children }: LayoutProps) => (
  <LayoutWrapper>
    <LayoutHeader>
      <TextBox primary brighter xl cursive>
        tag league
      </TextBox>
    </LayoutHeader>
    <LayoutBody>
      {children}
    </LayoutBody>
    <LayoutFooter>
      <TextBox sm primary brighter>
        tag league!
      </TextBox>
    </LayoutFooter>
  </LayoutWrapper>
);

export default Layout;
