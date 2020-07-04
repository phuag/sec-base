package com.phuag.sample.common.core.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class FastDFSFile {
	private String name;

	private byte[] content;

	private String ext;

	private String md5;

	private String author;

	public FastDFSFile(String name, byte[] content, String ext) {
		super();
		this.name = name;
		this.content = content;
		this.ext = ext;

	}

}