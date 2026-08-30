#!/usr/bin/env python3
"""Tests for check-codes.py."""
import importlib.util
import pathlib
import unittest

SPEC = importlib.util.spec_from_file_location(
    "check_codes", pathlib.Path(__file__).parent / "check-codes.py"
)
check_codes = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(check_codes)


class ExtractCodesTests(unittest.TestCase):
    def test_extracts_quoted_strings_in_order(self):
        text = 'strings := [\n    "Alpha",\n    "Beta"\n]\n'
        self.assertEqual(check_codes.extract_codes(text), ["Alpha", "Beta"])

    def test_no_array_exits(self):
        with self.assertRaises(SystemExit):
            check_codes.extract_codes("no array here")

    def test_empty_array(self):
        self.assertEqual(check_codes.extract_codes("strings := []"), [])


class ValidateCodesTests(unittest.TestCase):
    def test_no_codes_is_an_error(self):
        self.assertIn("no codes found", check_codes.validate_codes([]))

    def test_sorted_unique_codes_have_no_errors(self):
        self.assertEqual(check_codes.validate_codes(["Alpha", "Beta", "Gamma"]), [])

    def test_case_insensitive_duplicate_detected(self):
        errors = check_codes.validate_codes(["Alpha", "ALPHA"])
        self.assertTrue(any("duplicate code" in e for e in errors))

    def test_empty_entry_detected(self):
        errors = check_codes.validate_codes(["Alpha", "  ", "Beta"])
        self.assertIn("empty code entry", errors)

    def test_case_insensitive_out_of_order_detected(self):
        errors = check_codes.validate_codes(["beta", "Alpha"])
        self.assertTrue(any("out of order" in e for e in errors))


if __name__ == "__main__":
    unittest.main()
