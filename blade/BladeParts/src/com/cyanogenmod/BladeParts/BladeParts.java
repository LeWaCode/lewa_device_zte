package com.cyanogenmod.BladeParts;

import com.cyanogenmod.BladeParts.R;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.PreferenceScreen;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class BladeParts extends PreferenceActivity {
    //Begin,added by chenqiang for bug 4686,20120323
    private static final String KEY_USB_CHARGING = "usb_charging";

    private CheckBoxPreference mUSBCharging;
    //End

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		addPreferencesFromResource(R.xml.bladeparts);
		//Added by chenqiang for bug 4686,20120323
		mUSBCharging = (CheckBoxPreference) findPreference(KEY_USB_CHARGING);
	}

   private void writeValue(String parameter, int value) {
      try {
          FileOutputStream fos = new FileOutputStream(new File(parameter));
          fos.write(String.valueOf(value).getBytes());
          fos.flush();
          fos.getFD().sync();
          fos.close();
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

    //Begin,added by chenqiang for bug 4686,20120323
    @Override
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen,
            Preference preference) {
        if (preference == mUSBCharging) {
            SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
            // USB charging
            if(prefs.getBoolean("usb_charging", true)) {
                writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 1);
            } else {
                writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 0);
            }
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }
    //End

   @Override
   public void onPause() {
      super.onPause();
      //deleted by chenqiang for bug 4686,20120323
      /*
      SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
      // USB charging
      if(prefs.getBoolean("usb_charging", true))
         writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 1);
      else
         writeValue("/sys/module/msm_battery/parameters/usb_chg_enable", 0);
      */
   }
}
