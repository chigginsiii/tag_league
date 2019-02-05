import React from "react";
import styled from "@emotion/styled";
import { colors, text } from "./style"
import TextBox from "./style/textBox"

const LandingWrapper = styled.div({
  height: "100%",
  display: "flex",
  flexDirection: "column",
  justifyContent: "flex-start",
  alignItems: "stretch"
});

const LandingHeader = styled.div({
  flexGrow: 0,
  display: "flex",
  height: 60,
  justifyContent: "center",
  alignItems: "center"
});

const LandingBody = styled.div({
  flexGrow: 1,
  height: "auto",
  boxModel: "border-box",
  backgroundColor: colors.primary.brighter,
  color: colors.primary.dark,
  padding: 4
});

const LandingFooter = styled.div({
  flexGrow: 0,
  height: 40,
  display: "flex",
  padding: 4,
  width: "100%",
  alignItems: "center",
  justifyContent: "center"
});

const Landing = ({ }) => (
  <LandingWrapper>
    <LandingHeader>
      <TextBox primary brighter>
        tag league
      </TextBox>
    </LandingHeader>
    <LandingBody>
      <TextBox base>
        <ul>
          <li>League</li>
          <li>display upcoming/current event</li>
          <li>allow player to start card with num and pin</li>
        </ul>
      </TextBox>
    </LandingBody>
    <LandingFooter>
      <TextBox sm primary brighter>
        tag league!
      </TextBox>
    </LandingFooter>
  </LandingWrapper>
);

export default Landing;
