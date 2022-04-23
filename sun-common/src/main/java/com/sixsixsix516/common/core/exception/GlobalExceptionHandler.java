package com.sixsixsix516.common.core.exception;

import com.sixsixsix516.common.core.utils.StringUtils;
import com.sixsixsix516.common.utils.EnvUtil;
import com.sixsixsix516.common.vo.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.util.Objects;

/**
 * 全局异常处理器
 *
 * @author SUN
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 基础异常
     */
    @ExceptionHandler(BaseException.class)
    public Result<Void> baseException(BaseException e) {
        e.printStackTrace();
        return Result.fail(e.getMessage());
    }

    /**
     * 业务异常
     */
    @ExceptionHandler(CustomException.class)
    public Result<Void> businessException(CustomException e) {
        e.printStackTrace();
        if (StringUtils.isNull(e.getCode())) {
            return Result.fail(e.getMessage());
        }
        return Result.fail(e.getMessage());
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    public Result<Void> handlerNoFoundException(Exception e) {
        e.printStackTrace();
        return Result.fail("路径不存在，请检查路径是否正确");
    }


    @ExceptionHandler(Exception.class)
    public Result<Void> handleException(Exception e) {
        e.printStackTrace();
        // 推送报错信息给开发者
        pushFeiShuError(e);
        return Result.fail(e.getMessage());
    }

    /**
     * 自定义验证异常
     */
    @ExceptionHandler(BindException.class)
    public Result<Void> validatedBindException(BindException e) {
        e.printStackTrace();
        String message = e.getAllErrors().get(0).getDefaultMessage();
        return Result.fail(message);
    }

    /**
     * 自定义验证异常
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Object validExceptionHandler(MethodArgumentNotValidException e) {
        e.printStackTrace();
        String message = Objects.requireNonNull(e.getBindingResult().getFieldError()).getDefaultMessage();
        return Result.fail(message);
    }


    private void pushFeiShuError(Exception e) {
        if (EnvUtil.isProd) {
            String url = "";
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            if (attributes != null) {
                url = attributes.getRequest().getRequestURL().toString();
            }
            /*
            String errText =
                    "线上出现BUG\n"
                            + "\n [请求URL]: " + url
                            + "\n [报错项目]: " + applicationName
                            + "\n [报错时间]: " + DateUtils.getYMDHMS()
                            + "\n [报错人]: " + UserUtil.getUserId()
                            + "\n [报错原因]: " + e.getMessage()
                            // 堆栈 只打印出项目的信息
                            + "\n [报错堆栈]: " + Arrays.stream(e.getStackTrace()).map(StackTraceElement::toString).filter(stackTrace -> stackTrace.startsWith("cn.wkpower")).collect(Collectors.joining("\n"));

            */
        }
    }

    @Value("${spring.application.name}")
    private String applicationName;

}
