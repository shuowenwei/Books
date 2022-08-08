package com.example.databaseapp;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.NavUtils;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class ShowDataActivity extends Activity {

	ButtonDBHelper bDBh;
	ListView listview;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_show_data);
		// Show the Up button in the action bar.
		setupActionBar();

		// Open database
		bDBh = new ButtonDBHelper(this);
		
		listview = (ListView)findViewById(R.id.listView1);

		// Show rows from the database in the listview
		SQLiteDatabase db = bDBh.getReadableDatabase();

		// Define a projection that specifies which columns from the database
		// you will actually use after this query.
		String[] projection = {
				ButtonContract.ButtonEntry.COLUMN_NAME_ENTRY_ID,
				ButtonContract.ButtonEntry.COLUMN_NAME_TITLE,
				ButtonContract.ButtonEntry.COLUMN_NAME_SUBTITLE
		};

		// How you want the results sorted in the resulting Cursor
		String sortOrder =
				ButtonContract.ButtonEntry.COLUMN_NAME_TITLE + " DESC";

		// The Cursor contains the data resulting from the query
		Cursor c = db.query(
				ButtonContract.ButtonEntry.TABLE_NAME,  // The table to query
				projection,                               // The columns to return
				null,                                // The columns for the WHERE clause
				null,                            // The values for the WHERE clause
				null,                                     // don't group the rows
				null,                                     // don't filter by row groups
				sortOrder                                 // The sort order
				);

		// Iterate through the Cursor to get the data
		ArrayList<String> list = new ArrayList<String>();

		String entryid, title, subtitle;
		c.moveToFirst();
		do {
			entryid = c.getString(c.getColumnIndexOrThrow(ButtonContract.ButtonEntry.COLUMN_NAME_ENTRY_ID));
			title = c.getString(c.getColumnIndexOrThrow(ButtonContract.ButtonEntry.COLUMN_NAME_TITLE));
			subtitle = c.getString(c.getColumnIndexOrThrow(ButtonContract.ButtonEntry.COLUMN_NAME_SUBTITLE));
			list.add(entryid);
		}while (c.moveToNext());

		StableArrayAdapter adapter = new StableArrayAdapter(this,
				android.R.layout.simple_list_item_1, list);
		listview.setAdapter(adapter);

	}

	/**
	 * Set up the {@link android.app.ActionBar}, if the API is available.
	 */
	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	private void setupActionBar() {
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
			getActionBar().setDisplayHomeAsUpEnabled(true);
		}
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.show_data, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case android.R.id.home:
			// This ID represents the Home or Up button. In the case of this
			// activity, the Up button is shown. Use NavUtils to allow users
			// to navigate up one level in the application structure. For
			// more details, see the Navigation pattern on Android Design:
			//
			// http://developer.android.com/design/patterns/navigation.html#up-vs-back
			//
			NavUtils.navigateUpFromSameTask(this);
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

	private class StableArrayAdapter extends ArrayAdapter<String> {

		HashMap<String, Integer> mIdMap = new HashMap<String, Integer>();

		public StableArrayAdapter(Context context, int textViewResourceId,
				List<String> objects) {
			super(context, textViewResourceId, objects);
			for (int i = 0; i < objects.size(); ++i) {
				mIdMap.put(objects.get(i), i);
			}
		}

		@Override
		public long getItemId(int position) {
			String item = getItem(position);
			return mIdMap.get(item);
		}
		
		@Override
		public boolean hasStableIds() {
			return true;
		}
	}
}
