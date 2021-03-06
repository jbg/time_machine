// Portions of this work are Copyright 2018 The Time Machine Authors. All rights reserved.
// Portions of this work are Copyright 2018 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0, as found in the LICENSE.txt file.

import 'dart:async';

import 'package:time_machine/src/time_machine_internal.dart';

import 'package:test/test.dart';
import 'package:matcher/matcher.dart';

import '../time_machine_testing.dart';

/// Tests for the Badíʿ calendar system.
Future main() async {
  await runTests();
}

// For use with CreateBadíʿDate, this is a notional "month"
// containing Ayyam-i-Ha. The days here are represented in month
// 18 in LocalDate etc.
const int AyyamiHaMonth = 0;

@Test()
void BadiEpoch()
{
  LocalDate badiEpoch = CreateBadiDate(1, 1, 1);

  CalendarSystem gregorian = CalendarSystem.gregorian;
  LocalDate converted = badiEpoch.withCalendar(gregorian);

  LocalDate expected = new LocalDate(1844, 3, 21);

  expect(expected.toString(), converted.toString());
}

@Test()
void UnixEpoch()
{
  CalendarSystem badi = CalendarSystem.badi;
  LocalDate unixEpochInBadiCalendar = TimeConstants.unixEpoch.inZone(DateTimeZone.utc, badi).localDateTime.calendarDate;
  LocalDate expected = CreateBadiDate(126, 16, 2);
  expect(expected, unixEpochInBadiCalendar);
}

@Test()
void SampleDate()
{
  CalendarSystem badiCalendar = CalendarSystem.badi;
  LocalDate iso = new LocalDate(2017, 3, 4);
  LocalDate badi = iso.withCalendar(badiCalendar);

  expect(19, BadiMonth(badi));

  expect(Era.bahai, badi.era);
  expect(173, badi.yearOfEra);

  expect(173, badi.year);
  expect(badiCalendar.isLeapYear(173), isFalse);

  expect(4, BadiDay(badi));

  expect(DayOfWeek.saturday, badi.dayOfWeek);
}

@Test()
@TestCase(const [2016, 2, 26, 172, AyyamiHaMonth, 1])
@TestCase(const [2016, 2, 29, 172, AyyamiHaMonth, 4])
@TestCase(const [2016, 3, 1, 172, 19, 1])
@TestCase(const [2016, 3, 20, 173, 1, 1])
@TestCase(const [2016, 3, 20, 173, 1, 1])
@TestCase(const [2016, 3, 21, 173, 1, 2])
@TestCase(const [2016, 5, 26, 173, 4, 11])
@TestCase(const [2017, 3, 20, 174, 1, 1])
@TestCase(const [2018, 3, 21, 175, 1, 1])
@TestCase(const [2019, 3, 21, 176, 1, 1])
@TestCase(const [2020, 3, 20, 177, 1, 1])
@TestCase(const [2021, 3, 20, 178, 1, 1])
@TestCase(const [2022, 3, 21, 179, 1, 1])
@TestCase(const [2023, 3, 21, 180, 1, 1])
@TestCase(const [2024, 3, 20, 181, 1, 1])
@TestCase(const [2025, 3, 20, 182, 1, 1])
@TestCase(const [2026, 3, 21, 183, 1, 1])
@TestCase(const [2027, 3, 21, 184, 1, 1])
@TestCase(const [2028, 3, 20, 185, 1, 1])
@TestCase(const [2029, 3, 20, 186, 1, 1])
@TestCase(const [2030, 3, 20, 187, 1, 1])
@TestCase(const [2031, 3, 21, 188, 1, 1])
@TestCase(const [2032, 3, 20, 189, 1, 1])
@TestCase(const [2033, 3, 20, 190, 1, 1])
@TestCase(const [2034, 3, 20, 191, 1, 1])
@TestCase(const [2035, 3, 21, 192, 1, 1])
@TestCase(const [2036, 3, 20, 193, 1, 1])
@TestCase(const [2037, 3, 20, 194, 1, 1])
@TestCase(const [2038, 3, 20, 195, 1, 1])
@TestCase(const [2039, 3, 21, 196, 1, 1])
@TestCase(const [2040, 3, 20, 197, 1, 1])
@TestCase(const [2041, 3, 20, 198, 1, 1])
@TestCase(const [2042, 3, 20, 199, 1, 1])
@TestCase(const [2043, 3, 21, 200, 1, 1])
@TestCase(const [2044, 3, 20, 201, 1, 1])
@TestCase(const [2045, 3, 20, 202, 1, 1])
@TestCase(const [2046, 3, 20, 203, 1, 1])
@TestCase(const [2047, 3, 21, 204, 1, 1])
@TestCase(const [2048, 3, 20, 205, 1, 1])
@TestCase(const [2049, 3, 20, 206, 1, 1])
@TestCase(const [2050, 3, 20, 207, 1, 1])
@TestCase(const [2051, 3, 21, 208, 1, 1])
@TestCase(const [2052, 3, 20, 209, 1, 1])
@TestCase(const [2053, 3, 20, 210, 1, 1])
@TestCase(const [2054, 3, 20, 211, 1, 1])
@TestCase(const [2055, 3, 21, 212, 1, 1])
@TestCase(const [2056, 3, 20, 213, 1, 1])
@TestCase(const [2057, 3, 20, 214, 1, 1])
@TestCase(const [2058, 3, 20, 215, 1, 1])
@TestCase(const [2059, 3, 20, 216, 1, 1])
@TestCase(const [2060, 3, 20, 217, 1, 1])
@TestCase(const [2061, 3, 20, 218, 1, 1])
@TestCase(const [2062, 3, 20, 219, 1, 1])
@TestCase(const [2063, 3, 20, 220, 1, 1])
@TestCase(const [2064, 3, 20, 221, 1, 1])
void GeneralConversionNearNawRuz(int gYear, int gMonth, int gDay, int bYear, int bMonth, int bDay)
{
  // create in the Badíʿ calendar
  var bDate = CreateBadiDate(bYear, bMonth, bDay);
  var gDate = bDate.withCalendar(CalendarSystem.gregorian);
  expect(gYear, gDate.year);
  expect(gMonth, gDate.monthOfYear);
  expect(gDay, gDate.dayOfMonth);

  // convert to the Badíʿ calendar
  var bDate2 = new LocalDate(gYear, gMonth, gDay).withCalendar(CalendarSystem.badi);
  expect(bYear, bDate2.year);
  expect(bMonth, BadiMonth(bDate2));
  expect(bDay, BadiDay(bDate2));
}

@Test()
@TestCase(const [2012, 2, 29, 168, AyyamiHaMonth, 4])
@TestCase(const [2012, 3, 1, 168, AyyamiHaMonth, 5])
@TestCase(const [2015, 3, 1, 171, AyyamiHaMonth, 4])
@TestCase(const [2015, 3, 1, 171, AyyamiHaMonth, 4])
@TestCase(const [2016, 3, 1, 172, 19, 1])
@TestCase(const [2016, 3, 19, 172, 19, 19])
@TestCase(const [2017, 3, 1, 173, 19, 1])
@TestCase(const [2017, 3, 19, 173, 19, 19])
@TestCase(const [2018, 2, 24, 174, 18, 19])
@TestCase(const [2018, 2, 25, 174, AyyamiHaMonth, 1])
@TestCase(const [2018, 3, 1, 174, AyyamiHaMonth, 5])
@TestCase(const [2018, 3, 2, 174, 19, 1])
@TestCase(const [2018, 3, 19, 174, 19, 18])
void SpecialCases(int gYear, int gMonth, int gDay, int bYear, int bMonth, int bDay)
{
  // create in test calendar
  var bDate = CreateBadiDate(bYear, bMonth, bDay);

  // convert to gregorian
  var gDate = bDate.withCalendar(CalendarSystem.gregorian);

  expect("$gYear-$gMonth-$gDay", "${gDate.year}-${gDate.monthOfYear}-${gDate.dayOfMonth}");

  // create in gregorian
  // convert to test calendar
  var gDate2 = new LocalDate(gYear, gMonth, gDay);
  var bDate2 = gDate2.withCalendar(CalendarSystem.badi);

  expect("$bYear-$bMonth-$bDay", "${bDate2.year}-${BadiMonth(bDate2)}-${BadiDay(bDate2)}");
}

@Test()
@TestCase(const [1, 1, 1, 1844, 3, 21])
@TestCase(const [169, 1, 1, 2012, 3, 21])
@TestCase(const [170, 1, 1, 2013, 3, 21])
@TestCase(const [171, 1, 1, 2014, 3, 21])
@TestCase(const [171, 1, 1, 2014, 3, 21])
@TestCase(const [172, AyyamiHaMonth, 1, 2016, 2, 26])
@TestCase(const [172, AyyamiHaMonth, 2, 2016, 2, 27])
@TestCase(const [172, AyyamiHaMonth, 3, 2016, 2, 28])
@TestCase(const [172, AyyamiHaMonth, 4, 2016, 2, 29])
@TestCase(const [172, 1, 1, 2015, 3, 21])
@TestCase(const [172, 1, 1, 2015, 3, 21])
@TestCase(const [172, 17, 18, 2016, 2, 5])
@TestCase(const [172, 18, 17, 2016, 2, 23])
@TestCase(const [172, 18, 19, 2016, 2, 25])
@TestCase(const [172, 19, 1, 2016, 3, 1])
@TestCase(const [173, 1, 1, 2016, 3, 20])
@TestCase(const [173, 1, 1, 2016, 3, 20])
@TestCase(const [174, 1, 1, 2017, 3, 20])
@TestCase(const [175, 1, 1, 2018, 3, 21])
@TestCase(const [176, 1, 1, 2019, 3, 21])
@TestCase(const [177, 1, 1, 2020, 3, 20])
@TestCase(const [178, 1, 1, 2021, 3, 20])
@TestCase(const [179, 1, 1, 2022, 3, 21])
@TestCase(const [180, 1, 1, 2023, 3, 21])
@TestCase(const [181, 1, 1, 2024, 3, 20])
@TestCase(const [182, 1, 1, 2025, 3, 20])
@TestCase(const [183, 1, 1, 2026, 3, 21])
@TestCase(const [184, 1, 1, 2027, 3, 21])
@TestCase(const [185, 1, 1, 2028, 3, 20])
@TestCase(const [186, 1, 1, 2029, 3, 20])
@TestCase(const [187, 1, 1, 2030, 3, 20])
@TestCase(const [188, 1, 1, 2031, 3, 21])
@TestCase(const [189, 1, 1, 2032, 3, 20])
@TestCase(const [190, 1, 1, 2033, 3, 20])
@TestCase(const [191, 1, 1, 2034, 3, 20])
@TestCase(const [192, 1, 1, 2035, 3, 21])
@TestCase(const [193, 1, 1, 2036, 3, 20])
@TestCase(const [194, 1, 1, 2037, 3, 20])
@TestCase(const [195, 1, 1, 2038, 3, 20])
@TestCase(const [196, 1, 1, 2039, 3, 21])
@TestCase(const [197, 1, 1, 2040, 3, 20])
@TestCase(const [198, 1, 1, 2041, 3, 20])
@TestCase(const [199, 1, 1, 2042, 3, 20])
@TestCase(const [200, 1, 1, 2043, 3, 21])
@TestCase(const [201, 1, 1, 2044, 3, 20])
@TestCase(const [202, 1, 1, 2045, 3, 20])
@TestCase(const [203, 1, 1, 2046, 3, 20])
@TestCase(const [204, 1, 1, 2047, 3, 21])
@TestCase(const [205, 1, 1, 2048, 3, 20])
@TestCase(const [206, 1, 1, 2049, 3, 20])
@TestCase(const [207, 1, 1, 2050, 3, 20])
@TestCase(const [208, 1, 1, 2051, 3, 21])
@TestCase(const [209, 1, 1, 2052, 3, 20])
@TestCase(const [210, 1, 1, 2053, 3, 20])
@TestCase(const [211, 1, 1, 2054, 3, 20])
@TestCase(const [212, 1, 1, 2055, 3, 21])
@TestCase(const [213, 1, 1, 2056, 3, 20])
@TestCase(const [214, 1, 1, 2057, 3, 20])
@TestCase(const [215, 1, 1, 2058, 3, 20])
@TestCase(const [216, 1, 1, 2059, 3, 20])
@TestCase(const [217, 1, 1, 2060, 3, 20])
@TestCase(const [218, 1, 1, 2061, 3, 20])
@TestCase(const [219, 1, 1, 2062, 3, 20])
@TestCase(const [220, 1, 1, 2063, 3, 20])
@TestCase(const [221, 1, 1, 2064, 3, 20])
void GeneralWtoG(int bYear, int bMonth, int bDay, int gYear, int gMonth, int gDay)
{
  // create in this calendar
  var bDate = CreateBadiDate(bYear, bMonth, bDay);
  var gDate = bDate.withCalendar(CalendarSystem.gregorian);
  expect(gYear, gDate.year);
  expect(gMonth, gDate.monthOfYear);
  expect(gDay, gDate.dayOfMonth);

  // convert to this calendar
  var bDate2 = new LocalDate(gYear, gMonth, gDay).withCalendar(CalendarSystem.badi);
  expect(bYear, bDate2.year);
  expect(bMonth, BadiMonth(bDate2));
  expect(bDay, BadiDay(bDate2));
}

@Test()
@TestCase(const [172, 4])
@TestCase(const [173, 4])
@TestCase(const [174, 5])
@TestCase(const [175, 4])
@TestCase(const [176, 4])
@TestCase(const [177, 4])
@TestCase(const [178, 5])
@TestCase(const [179, 4])
@TestCase(const [180, 4])
@TestCase(const [181, 4])
@TestCase(const [182, 5])
@TestCase(const [183, 4])
@TestCase(const [184, 4])
@TestCase(const [185, 4])
@TestCase(const [186, 4])
@TestCase(const [187, 5])
@TestCase(const [188, 4])
@TestCase(const [189, 4])
@TestCase(const [190, 4])
@TestCase(const [191, 5])
@TestCase(const [192, 4])
@TestCase(const [193, 4])
@TestCase(const [194, 4])
@TestCase(const [195, 5])
@TestCase(const [196, 4])
@TestCase(const [197, 4])
@TestCase(const [198, 4])
@TestCase(const [199, 5])
@TestCase(const [200, 4])
@TestCase(const [201, 4])
@TestCase(const [202, 4])
@TestCase(const [203, 5])
@TestCase(const [204, 4])
@TestCase(const [205, 4])
@TestCase(const [206, 4])
@TestCase(const [207, 5])
@TestCase(const [208, 4])
@TestCase(const [209, 4])
@TestCase(const [210, 4])
@TestCase(const [211, 5])
@TestCase(const [212, 4])
@TestCase(const [213, 4])
@TestCase(const [214, 4])
@TestCase(const [215, 4])
@TestCase(const [216, 5])
@TestCase(const [217, 4])
@TestCase(const [218, 4])
@TestCase(const [219, 4])
@TestCase(const [220, 5])
@TestCase(const [221, 4])
void DaysInAyyamiHa(int bYear, int days)
{
  expect(days, BadiYearMonthDayCalculator.getDaysInAyyamiHa(bYear));
}

@Test()
@TestCase(const [165, 1, 1, 1])
@TestCase(const [170, 1, 1, 1])
@TestCase(const [172, 1, 1, 1])
@TestCase(const [175, 1, 1, 1])
@TestCase(const [173, 18, 1, 17 * 19 + 1])
@TestCase(const [173, 18, 19, 18 * 19])
@TestCase(const [173, AyyamiHaMonth, 1, 18 * 19 + 1])
@TestCase(const [173, 19, 1, 18 * 19 + 5])
@TestCase(const [220, AyyamiHaMonth, 1, 18 * 19 + 1])
@TestCase(const [220, AyyamiHaMonth, 5, 18 * 19 + 5])
@TestCase(const [220, 19, 1, 18 * 19 + 6])
void DayOfYear(int bYear, int bMonth, int bDay, int dayOfYear)
{
  var badi = new BadiYearMonthDayCalculator();
  expect(dayOfYear, badi.getDayOfYear(ILocalDate.yearMonthDay(CreateBadiDate(bYear, bMonth, bDay))));
}

// Cannot use EndOfMonth with Ayyam-i-Ha because they are internally stored as days in month 18.
// In Ayyam-i-Ha, EndOfMonth should throw an exception or return the last day of Ayyam-i-Ha.
// In this implementation, it will always return the last day of the month 18.
@Test()
@TestCase(const [173, 1, 1, 1, 19])
@TestCase(const [173, 18, 1, AyyamiHaMonth, 4])
@TestCase(const [173, AyyamiHaMonth, 1, AyyamiHaMonth, 4])
@TestCase(const [173, 19, 1, 19, 19])
@TestCase(const [220, 19, 1, 19, 19])
@TestCase(const [220, 4, 5, 4, 19])
@TestCase(const [220, 18, 1, AyyamiHaMonth, 5])
@TestCase(const [220, AyyamiHaMonth, 1, AyyamiHaMonth, 5])
void EndOfMonth(int year, int month, int day, int eomMonth, int eomDay)
{
  var start = CreateBadiDate(year, month, day);
  var end = CreateBadiDate(year, eomMonth, eomDay);
  expect(AsBadiString(end), AsBadiString(DateAdjusters.endOfMonth(start)));
}

@Test()
void LeapYear()
{
  var calendar = CalendarSystem.badi;
  expect(calendar.isLeapYear(172), isFalse);
  expect(calendar.isLeapYear(173), isFalse);
  expect(calendar.isLeapYear(207), isTrue);
  expect(calendar.isLeapYear(220), isTrue);
}

@Test()
void GetMonthsInYear()
{
  var calendar = CalendarSystem.badi;
  expect(19, calendar.getMonthsInYear(180));
}

@Test()
@TestCase(const [180, 1, 19])
@TestCase(const [180, 18, 23])
void GetDaysInMonth(int year, int month, int expectedDays)
{
  var calendar = CalendarSystem.badi;
  expect(expectedDays, calendar.getDaysInMonth(year, month));
}

@Test()
void CreateDate_InAyyamiHa()
{
  var d1 = CreateBadiDate(180, 0, 3);
  var d3 = CreateBadiDate(180, 18, 22);

  expect(d1, d3);
}

@Test()
@TestCase(const [180, -1, 1])
@TestCase(const [180, 1, -1])
@TestCase(const [180, 0, 0])
@TestCase(const [180, 0, 5])
@TestCase(const [182, 0, 6])
@TestCase(const [180, 1, 0])
@TestCase(const [180, 1, 20])
@TestCase(const [180, 20, 1])
void CreateDate_Invalid(int year, int month, int day)
{
  expect(() => CreateBadiDate(year, month, day), throwsRangeError);
}

// Period related tests
final LocalDate TestDate1_167_5_15 = CreateBadiDate(167, 5, 15);
final LocalDate TestDate1_167_6_7 = CreateBadiDate(167, 6, 7);
final LocalDate TestDate2_167_Ayyam_4 = CreateBadiDate(167, AyyamiHaMonth, 4);
final LocalDate TestDate3_168_Ayyam_5 = CreateBadiDate(168, AyyamiHaMonth, 5);

@Test()
void BetweenLocalDates_InvalidUnits()
{
  expect(() => Period.differenceBetweenDates(TestDate1_167_5_15, TestDate2_167_Ayyam_4, PeriodUnits.none), throwsArgumentError);
  expect(() => Period.differenceBetweenDates(TestDate1_167_5_15, TestDate2_167_Ayyam_4, new PeriodUnits(-1)), throwsArgumentError);
  expect(() => Period.differenceBetweenDates(TestDate1_167_5_15, TestDate2_167_Ayyam_4, PeriodUnits.allTimeUnits), throwsArgumentError);
  expect(() => Period.differenceBetweenDates(TestDate1_167_5_15, TestDate2_167_Ayyam_4, PeriodUnits.years | PeriodUnits.hours), throwsArgumentError);
}

@Test()
void SetYear()
{
  // crafted to test SetYear with 0
  var d1 = CreateBadiDate(180, 1, 1);
  LocalDate result = d1 + new Period(years: 0);
  expect(180, result.year);
}

@Test()
void BetweenLocalDates_MovingForwardNoLeapYears_WithExactResults()
{
  Period actual = Period.differenceBetweenDates(TestDate1_167_5_15, TestDate1_167_6_7);
  Period expected = new Period(days: 11);
  expect(expected, actual);
}

@Test()
void BetweenLocalDates_MovingForwardNoLeapYears_WithExactResults_2()
{
  Period actual = Period.differenceBetweenDates(TestDate1_167_5_15, TestDate2_167_Ayyam_4);
  Period expected = new Period(months: 13) + new Period(days: 8);
  expect(expected, actual);
}

@Test()
void BetweenLocalDates_MovingForwardInLeapYear_WithExactResults()
{
  Period actual = Period.differenceBetweenDates(TestDate1_167_5_15, TestDate3_168_Ayyam_5);
  Period expected = new Period(years: 1) + new Period(months: 13) + new Period(days: 9);
  expect(expected, actual);
}

@Test()
void BetweenLocalDates_MovingBackwardNoLeapYears_WithExactResults()
{
  Period actual = Period.differenceBetweenDates(TestDate2_167_Ayyam_4, TestDate1_167_5_15);
  Period expected = new Period(months: -13) + new Period(days: -8);
  expect(expected, actual);
}

@Test()
void BetweenLocalDates_MovingBackward_WithExactResults()
{
  // should be -1y -13m -9d
  // but system first moves back a year, and in that year, the last day of Ayyam-i-Ha is day 4
  // from there, it is -13m -8d

  Period expected = new Period(years: -1) + new Period(months: -13) + new Period(days: -8);
  Period actual = Period.differenceBetweenDates(TestDate3_168_Ayyam_5, TestDate1_167_5_15);
  expect(expected, actual);
}

@Test()
void BetweenLocalDates_MovingForward_WithJustMonths()
{
  Period actual = Period.differenceBetweenDates(TestDate1_167_5_15, TestDate3_168_Ayyam_5, PeriodUnits.months);
  Period expected = new Period(months: 32);
  expect(expected, actual);
}

@Test()
void BetweenLocalDates_MovingBackward_WithJustMonths()
{
  Period actual = Period.differenceBetweenDates(TestDate3_168_Ayyam_5, TestDate1_167_5_15, PeriodUnits.months);
  Period expected = new Period(months: -32);
  expect(expected, actual);
}

@Test()
void BetweenLocalDates_AsymmetricForwardAndBackward()
{
  LocalDate d1 = CreateBadiDate(166, 18, 4);
  LocalDate d2 = CreateBadiDate(167, 1, 10);

  // spanning Ayyam-i-Ha - not counted as a month
  expect(new Period(months: 2) + new Period(days: 6), Period.differenceBetweenDates(d1, d2));
  expect(new Period(months: -2) + new Period(days: -6), Period.differenceBetweenDates(d2, d1));
}

@Test()
void BetweenLocalDates_EndOfMonth()
{
  LocalDate d1 = CreateBadiDate(171, 5, 19);
  LocalDate d2 = CreateBadiDate(171, 6, 19);
  expect(new Period(months: 1), Period.differenceBetweenDates(d1, d2));
  expect(new Period(months: -1), Period.differenceBetweenDates(d2, d1));
}

@Test()
void BetweenLocalDates_OnLeapYear()
{
  LocalDate d1 = new LocalDate(2012, 2, 29).withCalendar(CalendarSystem.badi);
  LocalDate d2 = new LocalDate(2013, 2, 28).withCalendar(CalendarSystem.badi);

  expect("168-0-4", AsBadiString(d1));
  expect("169-0-3", AsBadiString(d2));

  expect(new Period(months: 19) + new Period(days: 18), Period.differenceBetweenDates(d1, d2));
}

@Test()
void BetweenLocalDates_AfterLeapYear()
{
  LocalDate d1 = CreateBadiDate(180, 19, 5);
  LocalDate d2 = CreateBadiDate(181, 19, 5);
  expect(new Period(years: 1), Period.differenceBetweenDates(d1, d2));
  expect(new Period(years: -1), Period.differenceBetweenDates(d2, d1));
}


@Test()
void Addition_DayCrossingMonthBoundary()
{
  LocalDate start = CreateBadiDate(182, 4, 13);
  LocalDate result = start + new Period(days: 10);
  expect(CreateBadiDate(182, 5, 4), result);
}

@Test()
void Addition()
{
  var start = CreateBadiDate(182, 1, 1);

  var result = start + new Period(days: 3);
  expect(CreateBadiDate(182, 1, 4), result);

  result = start + new Period(days: 20);
  expect(CreateBadiDate(182, 2, 2), result);
}

@Test()
void Addition_DayCrossingMonthBoundaryFromAyyamiHa()
{
  var start = CreateBadiDate(182, AyyamiHaMonth, 3);

  var result = start + new Period(days: 10);
  // in 182, Ayyam-i-Ha has 5 days
  expect(CreateBadiDate(182, 19, 8), result);
}

@Test()
void Addition_OneYearOnLeapDay()
{
  LocalDate start = CreateBadiDate(182, AyyamiHaMonth, 5);
  LocalDate result = start + new Period(years: 1);
  // Ayyam-i-Ha 5 becomes Ayyam-i-Ha 4
  expect(CreateBadiDate(183, AyyamiHaMonth, 4), result);
}

@Test()
void Addition_FiveYearsOnLeapDay()
{
  LocalDate start = CreateBadiDate(182, AyyamiHaMonth, 5);
  LocalDate result = start + new Period(years: 5);
  expect(CreateBadiDate(187, AyyamiHaMonth, 5), result);
}

@Test()
void Addition_YearMonthDay()
{
  // One year, one month, two days
  Period period = new Period(years: 1) + new Period(months: 1) + new Period(days: 2);
  LocalDate start = CreateBadiDate(171, 1, 19);
  // Periods are added in order, so this becomes...
  // Add one year: 172.1.19
  // Add one month: 172.2.19
  // Add two days: 172.3.2
  LocalDate result = start + period;
  expect(CreateBadiDate(172, 3, 2), result);
}

/// <summary>
/// Create a <see cref="LocalDate"/> in the Badíʿ calendar, treating 0
/// as the month containing Ayyam-i-Ha.
/// </summary>
/// <param name="year">Year in the Badíʿ calendar</param>
/// <param name="month">Month (use 0 for Ayyam-i-Ha)</param>
/// <param name="day">Day in month</param>
LocalDate CreateBadiDate(int year, int month, int day)
{
  if (month == AyyamiHaMonth)
  {
    Preconditions.checkArgumentRange('day', day, 1, BadiYearMonthDayCalculator.getDaysInAyyamiHa(year));
    // Move Ayyam-i-Ha days to fall after the last day of month 18.
    month = BadiYearMonthDayCalculator.month18;
    day += BadiYearMonthDayCalculator.daysInMonth;
  }
  return new LocalDate(year, month, day, CalendarSystem.badi);
}

/// <summary>
/// Return the day of this month, treating Ayyam-i-Ha as a separate month.
/// </summary>
int BadiDay(LocalDate input)
{
  Preconditions.checkArgument(input.calendar == CalendarSystem.badi, 'input', "Only valid when using the Badíʿ calendar");

  if (input.monthOfYear == BadiYearMonthDayCalculator.month18 &&
      input.dayOfMonth > BadiYearMonthDayCalculator.daysInMonth)
  {
    return input.dayOfMonth - BadiYearMonthDayCalculator.daysInMonth;
  }
  return input.dayOfMonth;
}

/// <summary>
/// Return the month of this date. If in Ayyam-i-Ha, returns 0.
/// </summary>
int BadiMonth(LocalDate input)
{
  Preconditions.checkArgument(input.calendar == CalendarSystem.badi, 'input', "Only valid when using the Badíʿ calendar");

  if (input.monthOfYear == BadiYearMonthDayCalculator.month18 &&
      input.dayOfMonth > BadiYearMonthDayCalculator.daysInMonth)
  {
    return AyyamiHaMonth;
  }
  return input.monthOfYear;
}

/// <summary>
/// Get a text representation of the date.
/// </summary>
@internal String AsBadiString(LocalDate input)
{
  var year = input.year;
  var month = BadiMonth(input);
  var day = BadiDay(input);

  return "$year-$month-$day";
}

@Test()
void HelperMethod_BadiDay()
{
  // ensure that this helper method is working
  expect(BadiDay(CreateBadiDate(180, 10, 10)), 10);
  expect(BadiDay(CreateBadiDate(180, 18, 19)), 19);
  expect(BadiDay(CreateBadiDate(180, 0, 3)), 3);
  expect(BadiDay(CreateBadiDate(180, 19, 1)), 1);
}

@Test()
void HelperMethod_BadiMonth()
{
  // ensure that this helper method is working
  expect(BadiMonth(CreateBadiDate(180, 10, 10)), 10);
  expect(BadiMonth(CreateBadiDate(180, 18, 19)), 18);
  expect(BadiMonth(CreateBadiDate(180, 0, 3)), 0);
  expect(BadiMonth(CreateBadiDate(180, 19, 1)), 19);
}

@Test()
void HelperMethod_AsBadiString()
{
  // ensure that this helper method is working
  expect(AsBadiString(CreateBadiDate(180, 10, 10)), "180-10-10");
  expect(AsBadiString(CreateBadiDate(180, 18, 19)), "180-18-19");
  expect(AsBadiString(CreateBadiDate(180, 0, 3)), "180-0-3");
  expect(AsBadiString(CreateBadiDate(180, 19, 1)), "180-19-1");
}
