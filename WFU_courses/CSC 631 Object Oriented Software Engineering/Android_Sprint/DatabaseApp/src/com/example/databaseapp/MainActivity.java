package com.example.databaseapp;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;

public class MainActivity extends Activity {
	
	ButtonDBHelper bDBh;
	EditText entryid;
	EditText title;
	EditText subtitle;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		// Create database
		bDBh = new ButtonDBHelper(this);
		
		entryid = (EditText)findViewById(R.id.entryid);
		title = (EditText)findViewById(R.id.title);
		subtitle = (EditText)findViewById(R.id.subtitle);
	}


	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	public void buttonStore(View v) {
		// Gets the data repository in write mode
		SQLiteDatabase db = bDBh.getWritableDatabase();

		// Get data from edit fields
		String entryidstr = entryid.getText().toString();
		String titlestr = title.getText().toString();
		String subtitlestr = subtitle.getText().toString();
		
		// Create a new map of values, where column names are the keys
		ContentValues values = new ContentValues();
		values.put(ButtonContract.ButtonEntry.COLUMN_NAME_ENTRY_ID, entryidstr);
		values.put(ButtonContract.ButtonEntry.COLUMN_NAME_TITLE, titlestr);
		values.put(ButtonContract.ButtonEntry.COLUMN_NAME_SUBTITLE, subtitlestr);

		// Insert the new row, returning the primary key value of the new row
		long newRowId;
		newRowId = db.insert(
				ButtonContract.ButtonEntry.TABLE_NAME,
				ButtonContract.ButtonEntry.COLUMN_NAME_NULLABLE,
				values);
		
		Intent intent = new Intent(this, ShowDataActivity.class);
		startActivity(intent);
	}

}
