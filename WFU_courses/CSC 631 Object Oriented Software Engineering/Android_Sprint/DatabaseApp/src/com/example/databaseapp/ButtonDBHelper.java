package com.example.databaseapp;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class ButtonDBHelper extends SQLiteOpenHelper {

	public static final int DATABASE_VERSION = 1;
    public static final String DATABASE_NAME = "VVButton.db";
    
    private static final String TEXT_TYPE = " TEXT";
    private static final String COMMA_SEP = ",";
    
    private static final String SQL_CREATE_ENTRIES =
        "CREATE TABLE " + ButtonContract.ButtonEntry.TABLE_NAME + " (" +
        		ButtonContract.ButtonEntry._ID + " INTEGER PRIMARY KEY," +
        		ButtonContract.ButtonEntry.COLUMN_NAME_ENTRY_ID + TEXT_TYPE + COMMA_SEP +
        		ButtonContract.ButtonEntry.COLUMN_NAME_TITLE + TEXT_TYPE + COMMA_SEP +
        		ButtonContract.ButtonEntry.COLUMN_NAME_SUBTITLE + TEXT_TYPE +
        " )";

    private static final String SQL_DELETE_ENTRIES =
        "DROP TABLE IF EXISTS " + ButtonContract.ButtonEntry.TABLE_NAME;
    
	public ButtonDBHelper(Context context) {
		super(context, DATABASE_NAME, null, DATABASE_VERSION);
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		db.execSQL(SQL_CREATE_ENTRIES);
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		db.execSQL(SQL_DELETE_ENTRIES);
		onCreate(db);
		
	}
	
}

