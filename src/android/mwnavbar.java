package com.mei1.navbar;

import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import android.app.Activity;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.FrameLayout;
import android.widget.Toolbar;


/**
 * This class echoes a string called from JavaScript.
 */
public class mwnavbar extends CordovaPlugin {

    private TextView textView;
    private ImageButton btn;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        FrameLayout layout = (FrameLayout) webView.getView().getParent();
        FrameLayout.LayoutParams p1 = (FrameLayout.LayoutParams)webView.getView().getLayoutParams();
        int h = ((int)TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 44, layout.getResources().getDisplayMetrics()));
        p1.topMargin += h;
        webView.getView().setLayoutParams(p1);
        btn = new ImageButton(layout.getContext());
        Resources activityRes = cordova.getActivity().getResources();
        int resId = activityRes.getIdentifier("ic_mw_back", "drawable", cordova.getActivity().getPackageName());
        Drawable icon = activityRes.getDrawable(resId);
        btn.setImageDrawable(icon);
        btn.setBackgroundColor(Color.TRANSPARENT);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(h, h);
        btn.setLayoutParams(params);
        btn.setVisibility(View.GONE);
        btn.setOnClickListener(new View.OnClickListener(){
            public void onClick(View v) {
                if (webView.getEngine().canGoBack()) {
                    webView.getEngine().goBack();
                }
            }
        });
        textView = new TextView(layout.getContext());
        textView.setBackgroundColor(Color.rgb(242, 242, 242));
        textView.setLayoutParams(new FrameLayout.LayoutParams(layout.getResources().getDisplayMetrics().widthPixels, h));
        textView.setTextColor(Color.BLACK);
        textView.setPadding(h, 0, h, 0);
        textView.setGravity(Gravity.CENTER);
        textView.setSingleLine(true);
        textView.setEllipsize(TextUtils.TruncateAt.END);
        layout.addView(textView);
        layout.addView(btn);
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("setTitle")) {
            String message = args.getString(0);
            this.setTitle(message, callbackContext);
            return true;
        } else if (action.equals("showLeftButton")) {
            this.showLeftButton(args, callbackContext);
            return true;
        } else if (action.equals("hideLeftButton")) {
            this.hideLeftButton(args, callbackContext);
            return true;
        }
        return false;
    }
    private void setTitle(String message, CallbackContext callbackContext) {
        cordova.getActivity().runOnUiThread(new Runnable(){
            @Override
            public void run() {
                textView.setText(message);
            }
        });
    }
    private void showLeftButton(JSONArray args, CallbackContext callbackContext) {
        cordova.getActivity().runOnUiThread(new Runnable(){
            @Override
            public void run() {
                btn.setVisibility(View.VISIBLE);
            }
        });
    }
    private void hideLeftButton(JSONArray args, CallbackContext callbackContext) {

        cordova.getActivity().runOnUiThread(new Runnable(){
            @Override
            public void run() {
                btn.setVisibility(View.GONE);
            }
        });
    }
}
