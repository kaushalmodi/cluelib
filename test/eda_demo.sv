// Time-stamp: <2021-05-20 13:03:22 kmodi>

// https://www.edaplayground.com/x/ua

/* This is a demo of utility functions for text processing in ClueLib.
 * For better viewing, widen this pane so that this text fits on a single line:
 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 *
 * Other utilities of ClueLib include:
 * - Containers (pair, tuple, aggregates, collections)
 * - Comparators
 * - Formatters
 * - Verification utilities (random number generators, timer, journal)
 * - Domain-specific (crc, scramblers)
 * - many others
 *
 * ClueLib was developed by ClueLogic, LLC
 */

import cl::*; // ClueLib package

module text_demo;
  task automatic test;
    $display( "==========starting text_demo==========" );
    // test ../src/cl_text.svh
    begin
      assert( text::capitalize( "capitalize me!" ) == "Capitalize me!" );
    end
    begin
      assert( text::center( "center me", 15 )                 == "   center me   " );
      assert( text::center( "center me", 15, "-" )            == "---center me---" );
      assert( text::center( "center me", 7 )                  ==    "center me"    ); // widened to fit
      assert( text::center( "center me", 7, .trim_ends( 1 ) ) ==     "enter m"     ); // trimmed
    end
    begin
      assert( text::change( "a primary library", "function", .start_pos( 10 ) ) == "a primary function" );
      //                               |---->|
      //                              10
    end
    begin
      assert( text::chomp( "abc"     ) == "abc" );
      assert( text::chomp( "abc\n"   ) == "abc" );
      assert( text::chomp( "abc\n\n" ) == "abc\n" );
    end
    begin
      assert( text::chop( "abc" ) == "c" );
      assert( text::chop( "abc\n" ) == "\n" );
    end
    begin
      assert( text::contains( "a primary library", "primary" )                  == 1 );
      assert( text::contains( "a primary library", "primary", .start_pos( 3 ) ) == 0 );
      //                          |----------->|
      //                          3
      assert( text::contains( "a primary library", "primary", .end_pos(  7 ) )  == 0 );
      //                       |----->|
      //                              7
      assert( text::contains( "a primary library", "primary", .end_pos( -9 ) )  == 1 );
      //                       |------>|
      //                              -9
    end
    begin
      assert( text::contains_str( "a primary library", "primary" )                  == "primary" );
      assert( text::contains_str( "a primary library", "primary", .start_pos( 3 ) ) == "" );
      //                              |----------->|
      //                              3
      assert( text::contains_str( "a primary library", "primary", .end_pos(  7 ) )  == "" );
      //                           |----->|
      //                                  7
      assert( text::contains_str( "a primary library", "primary", .end_pos( -9 ) )  == "primary" );
      //                           |------>|
      //                                  -9
    end
    begin
      assert( text::count( "a primary library", "ary" )                  == 2 );
      assert( text::count( "a primary library", "ary", .start_pos( 3 ) ) == 2 );
      //                       |----------->|
      //                       3
      assert( text::count( "a primary library", "ary", .end_pos(  7 ) )  == 0 );
      //                    |----->|
      //                           7
      assert( text::count( "a primary library", "ary", .end_pos( -9 ) )  == 1 );
      //                    |------>|
      //                           -9
    end
    begin
      assert( text::delete( "abcabc", "abc"    ) == "" );
      assert( text::delete( "abcabc", "abc", 1 ) == "abc" );
    end
    begin
      assert( text::ends_with( "a primary library", { "primary", "library" } )                  == 1 );
      assert( text::ends_with( "a primary library", { "primary", "library" }, .start_pos( 3 ) ) == 1 );
      //                           |----------->|
      //                           3
      assert( text::ends_with( "a primary library", { "primary", "library" }, .end_pos(  7 ) )  == 0 );
      //                        |----->|
      //                               7
      assert( text::ends_with( "a primary library", { "primary", "library" }, .end_pos( -9 ) )  == 1 );
      //                        |------>|
      //                               -9
    end
    begin
      assert( text::find_any( "a primary library", { "primary", "library" } ) ==  2 );
      assert( text::find_any( "a primary library", { "primary", "library" }, .start_pos( 3 ) ) == 10 );
      //                          |----------->|
      //                          3
      assert( text::find_any( "a primary library", { "primary", "library" }, .end_pos(  7 ) ) == -1 );
      //                       |----->|
      //                              7
      assert( text::find_any( "a primary library", { "primary", "library" }, .end_pos( -9 ) ) ==  2 );
      //                       |------>|
      //                              -9
    end
    begin
      assert( text::hash( "my hash value is" ) == 32'he4260597 );
    end
    begin
      assert( text::index( "a primary library", "ary" )                  ==  6 );
      assert( text::index( "a primary library", "ary", .start_pos( 3 ) ) ==  6 );
      //                       |----------->|
      //                       3
      assert( text::index( "a primary library", "ary", .end_pos(  7 ) )  == -1 );
      //                    |----->|
      //                           7
      assert( text::index( "a primary library", "ary", .end_pos( -9 ) )  ==  6 );
      //                    |------>|
      //                           -9
    end
    begin
      // insert "XYZ" before the first character ("a")
      assert( text::insert( "abc", "XYZ"     ) == "XYZabc" );
      // insert "XYZ" before the character index 1 ("b")
      assert( text::insert( "abc", "XYZ",  1 ) == "aXYZbc" );
      // insert "XYZ" before the last character ("c")
      assert( text::insert( "abc", "XYZ", -1 ) == "abXYZc" );
    end
    begin
      assert( text::is_alpha( "abc"  ) == 1 );
      assert( text::is_alpha( "abc_" ) == 0 );
    end
    begin
      assert( text::is_digit( "123"  ) == 1 );
      assert( text::is_digit( "123X" ) == 0 );
    end
    begin
      assert( text::is_lower( "abc"   ) == 1 );
      assert( text::is_lower( "abcX"  ) == 0 );
      assert( text::is_lower( "abc!?" ) == 1 ); // all cased characters are lowercase
    end
    begin
      assert( text::is_printable( "!@#$" ) == 1 );
      assert( text::is_printable( "\200" ) == 0 ); // ASCII 'h80 is not printable
    end
    begin
      assert( text::is_single_bit_type( "bit" ) == 1 );
      assert( text::is_single_bit_type( "int" ) == 0 );
    end
    begin
      assert( text::is_space( " \t\n" ) == 1 );
      assert( text::is_space( "X\t\n" ) == 0 );
    end
    begin
      assert( text::is_upper( "ABC"   ) == 1 );
      assert( text::is_upper( "ABCx"  ) == 0 );
      assert( text::is_upper( "ABC!?" ) == 1 ); // all cased characters are uppercase
    end
    begin
      assert( text::join_str( { "abc", "XYZ" }        ) == "abcXYZ"    );
      assert( text::join_str( { "abc", "XYZ" }, "---" ) == "abc---XYZ" );
    end
    begin
      assert( text::lc_first( "Lower CASE first" ) == "lower CASE first" );
    end
    begin
      assert( text::ljust( "ljust me", 15 )                  == "ljust me       " );
      assert( text::ljust( "ljust me", 15, "-" )             == "ljust me-------" );
      assert( text::ljust( "ljust me", 7 )                   == "ljust me"        ); // widened to fit
      assert( text::ljust( "ljust me", 7, .trim_right( 1 ) ) == "ljust m"         ); // trimmed
    end
    begin
      assert( text::lstrip( "      abc" ) == "abc" );
      assert( text::lstrip( "  \t\nabc" ) == "abc" );
      assert( text::lstrip( "aabbcc", "a"  ) == "bbcc" );
      assert( text::lstrip( "aabbcc", "ab" ) == "cc"   );
      assert( text::lstrip( "aabbcc", "ba" ) == "cc"   ); // "b"s and "a"s are stripped
    end
    begin
      assert( text::only( "abc", "abcXYZ" ) == 1 );
      assert( text::only( "abcXYZ", "abc" ) == 0 );
    end
    begin
      three_strings s, t1, t2, t3, t4;

      s = '{ "abc", "-", "XYZ" };
      assert( text::partition( "abc-XYZ", "-" ) == s );

      t1 = '{ "", "a", "bcabc" };
      t2 = '{ "a", "b", "cabc" };
      t3 = '{ "ab", "c", "abc" };
      t4 = '{ "abcabc", "", "" };
      assert( text::partition( "abcabc", "a" ) == t1 );
      assert( text::partition( "abcabc", "b" ) == t2 );
      assert( text::partition( "abcabc", "c" ) == t3 );
      assert( text::partition( "abcabc", "X" ) == t4 );
    end
    begin
      assert( text::replace( "abcabc", "abc", "XYZ"    ) == "XYZXYZ" );
      assert( text::replace( "abcabc", "abc", "XYZ", 1 ) == "XYZabc" );
    end
    begin
      assert( text::reverse( "reverse me!" ) == "!em esrever" );
      assert( text::reverse( "wonton? not now" ) == "won ton ?notnow" );
    end
    begin
      assert( text::rfind_any( "a primary library", { "primary", "library" } )                  == 10 );
      assert( text::rfind_any( "a primary library", { "primary", "library" }, .start_pos( 3 ) ) == 10 );
      //                           |----------->|
      //                           3
      assert( text::rfind_any( "a primary library", { "primary", "library" }, .end_pos(  7 ) )  == -1 );
      //                        |----->|
      //                               7
      assert( text::rfind_any( "a primary library", { "primary", "library" }, .end_pos( -9 ) )  ==  2 );
      //                        |------>|
      //                               -9
    end
    begin
      assert( text::rindex( "a primary library", "ary" )                  == 14 );
      assert( text::rindex( "a primary library", "ary", .start_pos( 3 ) ) == 14 );
      //                        |----------->|
      //                        3
      assert( text::rindex( "a primary library", "ary", .end_pos(  7 ) )  == -1 );
      //                     |----->|
      //                            7
      assert( text::rindex( "a primary library", "ary", .end_pos( -9 ) )  ==  6 );
      //                     |------>|
      //                            -9
    end
    begin
      assert( text::rjust( "rjust me", 15 )                 == "       rjust me" );
      assert( text::rjust( "rjust me", 15, "-" )            == "-------rjust me" );
      assert( text::rjust( "rjust me", 7 )                  ==        "rjust me" ); // widened to fit
      assert( text::rjust( "rjust me", 7, .trim_left( 1 ) ) ==         "just me" ); // trimmed
    end
    begin
      three_strings s, t1, t2, t3, t4;

      s = '{ "abc", "-", "XYZ" };
      assert( text::rpartition( "abc-XYZ", "-" ) == s );

      t1 = '{ "abc", "a", "bc" };
      t2 = '{ "abca", "b", "c" };
      t3 = '{ "abcab", "c", "" };
      t4 = '{ "abcabc", "", "" };
      assert( text::rpartition( "abcabc", "a" ) == t1 );
      assert( text::rpartition( "abcabc", "b" ) == t2 );
      assert( text::rpartition( "abcabc", "c" ) == t3 );
      assert( text::rpartition( "abcabc", "X" ) == t4 );
    end
    begin
      string_q s1, s2, s3, s4, t1, t2, t3, t4, t5;

      s1 = '{ "abc", "pqr", "xyz" };
      s2 = '{ "  abc  pqr", "xyz" };
      s3 = '{ "  abc", "pqr", "xyz" };
      s4 = '{ "abc", "pqr", "xyz" };
      assert( text::rsplit( "  abc  pqr  xyz  "                  ) == s1 );
      assert( text::rsplit( "  abc  pqr  xyz  ", .max_split( 1 ) ) == s2 );
      assert( text::rsplit( "  abc  pqr  xyz  ", .max_split( 2 ) ) == s3 );
      assert( text::rsplit( "  abc  pqr  xyz  ", .max_split( 3 ) ) == s4 );

      t1 = '{ "", "abc", "pqr", "xyz", "" };
      t2 = '{ "--abc--pqr--xyz", "" };
      t3 = '{ "--abc--pqr", "xyz", "" };
      t4 = '{ "--abc", "pqr", "xyz", "" };
      t5 = '{ "", "abc", "pqr", "xyz", "" };
      assert( text::rsplit( "--abc--pqr--xyz--", "--"                  ) == t1 );
      assert( text::rsplit( "--abc--pqr--xyz--", "--", .max_split( 1 ) ) == t2 );
      assert( text::rsplit( "--abc--pqr--xyz--", "--", .max_split( 2 ) ) == t3 );
      assert( text::rsplit( "--abc--pqr--xyz--", "--", .max_split( 3 ) ) == t4 );
      assert( text::rsplit( "--abc--pqr--xyz--", "--", .max_split( 4 ) ) == t5 );
    end
    begin
      assert( text::rstrip( "abc      " ) == "abc" );
      assert( text::rstrip( "abc  \t\n" ) == "abc" );
      assert( text::rstrip( "aabbcc", "c"  ) == "aabb" );
      assert( text::rstrip( "aabbcc", "bc" ) == "aa"   );
      assert( text::rstrip( "aabbcc", "cb" ) == "aa"   ); // "c"s and "b"s are stripped
    end
    begin
      assert( text::slice( "slice me",  2,  6 ) == "ice m" );
      assert( text::slice( "slice me", -6, -2 ) == "ice m" );
    end
    begin
      assert( text::slice_len( "slice me",  2, 5 ) == "ice m" );
      assert( text::slice_len( "slice me", -6, 5 ) == "ice m" );
    end
    begin
      string_q s1, s2, s3, s4, t1, t2, t3, t4, t5;

      s1 = '{ "abc", "pqr", "xyz" };
      s2 = '{ "abc", "pqr  xyz  " };
      s3 = '{ "abc", "pqr", "xyz  " };
      s4 = '{ "abc", "pqr", "xyz" };
      assert( text::split( "  abc  pqr  xyz  "                  ) == s1 );
      assert( text::split( "  abc  pqr  xyz  ", .max_split( 1 ) ) == s2 );
      assert( text::split( "  abc  pqr  xyz  ", .max_split( 2 ) ) == s3 );
      assert( text::split( "  abc  pqr  xyz  ", .max_split( 3 ) ) == s4 );

      t1 = '{ "", "abc", "pqr", "xyz", "" };
      t2 = '{ "", "abc--pqr--xyz--" };
      t3 = '{ "", "abc", "pqr--xyz--" };
      t4 = '{ "", "abc", "pqr", "xyz--" };
      t5 = '{ "", "abc", "pqr", "xyz", "" };
      assert( text::split( "--abc--pqr--xyz--", "--"                  ) == t1 );
      assert( text::split( "--abc--pqr--xyz--", "--", .max_split( 1 ) ) == t2 );
      assert( text::split( "--abc--pqr--xyz--", "--", .max_split( 2 ) ) == t3 );
      assert( text::split( "--abc--pqr--xyz--", "--", .max_split( 3 ) ) == t4 );
      assert( text::split( "--abc--pqr--xyz--", "--", .max_split( 4 ) ) == t5 );
    end
    begin
      assert( text::starts_with( "a primary library", { "a primary", "library" } )                   == 1 );
      assert( text::starts_with( "a primary library", { "a primary", "library" }, .start_pos( 10 ) ) == 1 );
      //                                    |---->|
      //                                   10
      assert( text::starts_with( "a primary library", { "a primary", "library" }, .end_pos(  7 ) )  == 0 );
      //                          |----->|
      //                                 7
      assert( text::starts_with( "a primary library", { "a primary", "library" }, .end_pos( -9 ) )  == 1 );
      //                          |------>|
      //                                 -9
    end
    begin
      assert( text::strip( "   abc    " ) == "abc" );
      assert( text::strip( " \t\nabc\n" ) == "abc" );
      assert( text::strip( "aabbcc", "a"  ) == "bbcc" );
      assert( text::strip( "aabbcc", "ab" ) == "cc"   );
      assert( text::strip( "aabbcc", "ac" ) == "bb"   );
    end
    begin
      assert( text::swap_case( "Swap Case Me!" ) == "sWAP cASE mE!" );
    end
    begin
      assert( text::title_case( "title case me!" ) == "Title Case Me!" );
    end
    begin
      assert( text::trim( "trim me!"       ) == "trim me!" );
      assert( text::trim( "trim me!", 1, 2 ) ==  "rim m"   );
      assert( text::trim( "trim me!", 3, 4 ) ==    "m"     );
    end
    begin
      assert( text::uc_first( "upper CASE first" ) == "Upper CASE first" );
    end
    begin
      assert( text::untabify( "AB\tCDE\tFGHI\tJKLMN" ) == "AB      CDE     FGHI    JKLMN" );
      // tab positions: ^       ^       ^       ^
      assert( text::untabify( "AB\tCDE\tFGHI\tJKLMN", 4 ) == "AB  CDE FGHI    JKLMN" );
      // tab positions:    ^   ^   ^   ^   ^   ^
      assert( text::untabify( "AB\nCDE\tFGHI\tJKLMN", 4 ) == "AB\nCDE FGHI    JKLMN" );
      // tab positions:    ^   ^   ^   ^   ^   ^
    end
    $display( "==========finished text_demo==========" );
  endtask: test

  initial test();
endmodule: text_demo
