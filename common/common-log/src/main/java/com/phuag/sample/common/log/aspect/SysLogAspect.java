/*
 *
 *  *  Copyright (c) 2019-2020, 冷冷 (wangiegie@gmail.com).
 *  *  <p>
 *  *  Licensed under the GNU Lesser General Public License 3.0 (the "License");
 *  *  you may not use this file except in compliance with the License.
 *  *  You may obtain a copy of the License at
 *  *  <p>
 *  * https://www.gnu.org/licenses/lgpl.html
 *  *  <p>
 *  * Unless required by applicable law or agreed to in writing, software
 *  * distributed under the License is distributed on an "AS IS" BASIS,
 *  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  * See the License for the specific language governing permissions and
 *  * limitations under the License.
 *
 */

package com.phuag.sample.common.log.aspect;

import com.phuag.sample.admin.api.entity.SysLog;
import com.phuag.sample.common.core.util.SpringContextHolder;
import com.phuag.sample.common.log.annotation.AccessLogger;
import com.phuag.sample.common.log.event.SysLogEvent;
import com.phuag.sample.common.log.util.LogUtils;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

/**
 * 操作日志使用spring event异步入库
 *
 * @author L.cm
 */
@Aspect
@Slf4j
public class SysLogAspect {

	@Around("@annotation(accessLogger)")
	@SneakyThrows
	public Object around(ProceedingJoinPoint point, AccessLogger accessLogger) {
		String strClassName = point.getTarget().getClass().getName();
		String strMethodName = point.getSignature().getName();
		log.debug("[类名]:{},[方法]:{}", strClassName, strMethodName);

		SysLog logVo = LogUtils.getSysLog();
		logVo.setTitle(accessLogger.module());
		// 发送异步日志事件
		Object obj = point.proceed();
		SpringContextHolder.publishEvent(new SysLogEvent(logVo));
		return obj;
	}

}
