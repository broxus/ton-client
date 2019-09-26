import Dependencies._
import sbt.Keys._
import sbt._

name := "ton-client"

organization := "io.broxus"

scalaVersion := "2.12.8"

lazy val `ton-client` = (project in file("."))
    .settings(
        libraryDependencies ++= Seq(
        )
    )
    .dependsOn(
    )

publishArtifact in Test := false
publishArtifact in(Compile, packageBin) := true
publishArtifact in(Compile, packageDoc) := false
publishArtifact in(Compile, packageSrc) := true
