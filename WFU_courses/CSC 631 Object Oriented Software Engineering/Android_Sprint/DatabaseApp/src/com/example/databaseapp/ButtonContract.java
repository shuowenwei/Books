package com.example.databaseapp;
import android.provider.BaseColumns;


public final class ButtonContract {
    // To prevent someone from accidentally instantiating the contract class,
    // give it an empty constructor.
    public ButtonContract() {}

    /* Inner class that defines the table contents */
    public static abstract class ButtonEntry implements BaseColumns {
        public static final String TABLE_NAME = "buttons";
        public static final String COLUMN_NAME_ENTRY_ID = "entryid";
        public static final String COLUMN_NAME_TITLE = "title";
        public static final String COLUMN_NAME_SUBTITLE = "subtitle";
        public static final String COLUMN_NAME_NULLABLE = "nullable";
    }
}
