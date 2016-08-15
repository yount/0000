package com.wechat.po;

import static org.junit.Assert.*;

import org.junit.Test;

public class EntryTest {

	private Entry entry = null;
	
	@Test
	public void testEntry() {
		entry = new Entry();
		entry = new Entry("aaa","bbb");
		assertEquals("aaa",entry.getName());
		assertEquals("bbb",entry.getMessage());
	}

}
