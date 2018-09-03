package com.business.help;

import java.util.ArrayList;
import java.util.List;

import com.business.dto.model.RestfulResult;
import com.business.help.Dynatree;



public class Dynatree {
	String title = null; // (required) Displayed name of the node (html is
							// allowed here)
	String key = null; // May be used with activate(), select(), find(), ...
	boolean expand = false; // Initial expanded status.
	boolean select = false; // Initial selected status.
	List<Dynatree> children = new ArrayList<Dynatree>();

	private RestfulResult result;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public boolean isExpand() {
		return expand;
	}

	public void setExpand(boolean expand) {
		this.expand = expand;
	}

	public boolean isSelect() {
		return select;
	}

	public void setSelect(boolean select) {
		this.select = select;
	}

	public List<Dynatree> getChildren() {
		return children;
	}

	public void setChildren(List<Dynatree> children) {
		this.children = children;
	}

	public RestfulResult getResult() {
		return result;
	}

	public void setResult(RestfulResult result) {
		this.result = result;
	}

}
